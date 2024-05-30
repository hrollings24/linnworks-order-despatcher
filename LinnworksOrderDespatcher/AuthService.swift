//
//  AuthService.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 29/12/2022.
//

import Foundation
import CoreData
import JWTDecode
import AuthenticationServices
import Combine
import CommonCrypto

class AuthService: NSObject, NSFetchedResultsControllerDelegate{
    
    static let shared = AuthService()
    
    var oauthDetails: [OAuthEntity] = []
    @Published var loggedIn: LoadingState = LoadingState.Loading
    
    private var fetchResultsController: NSFetchedResultsController<OAuthEntity>
    
    override init() {
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: OAuthEntity.all, managedObjectContext: CoreDataManager.shared.container.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        self.fetchResultsController.delegate = self
        self.loadTokensFromCoreData()
    }
        
    func loadTokensFromCoreData() {
        do {
            try fetchResultsController.performFetch()
            oauthDetails = fetchResultsController.fetchedObjects ?? []
            self.loggedIn = (oauthDetails.count > 0) ? LoadingState.True : LoadingState.False
            if (loggedIn == LoadingState.True)
            {
                print(oauthDetails[0].accessToken!)
            }
            
            //We should check access token is not expired and works, if not refresh it
            //getSession(accessToken: oauthDetails[0].accessToken!)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func logout() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OAuthEntity")

        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try CoreDataManager.shared.container.viewContext.execute(batchDeleteRequest)
            
            loggedIn = LoadingState.False
        } catch {
            // Error Handling
        }
    }
    
    func getNameFromToken() -> String {
        guard let token = oauthDetails[0].accessToken else {
            return ""
        }
        
        do {
            let jwt = try decode(jwt: token)
            
            let claimAsString = jwt.claim(name: "name").string
            guard let name = claimAsString else {
                return ""
            }
            return name
        }
        catch {
            return ""
        }
    }
    
    func RefreshToken() async throws -> OAuth2Credentials {
        
         let (data, _) = try await URLSession.shared.data(for: getRequest().buildRefreshURL(refreshToken: oauthDetails[0].refreshToken!))

        // Parse the JSON data
        let result = try JSONDecoder().decode(OAuth2Credentials.self, from: data)
        return result
        
    }
    
    
    public func getRequest() -> OAuth2Request
    {
        let codeVerifier = generateCodeVerifier()
        let codeChallenge = generateCodeChallenge(codeVerifier: codeVerifier)
        
        let clientID = Bundle.main.infoDictionary?["LINNWORKS_CLIENT_ID"] as! String
        let clientSecret = Bundle.main.infoDictionary?["LINNWORKS_CLIENT_SECRET"] as! String
        let escapedRedirectUrl = Bundle.main.infoDictionary?["REDIRECT_URL"] as! String
        let redirectUrl = escapedRedirectUrl.replacingOccurrences(of: "\\/", with: "/")


        let request: OAuth2Request = OAuth2Request(
            authUrl: "https://dev-login.linnworks.net/connect/authorize",
            tokenUrl: "https://dev-login.linnworks.net/connect/token",
            clientId: clientID,
            redirectUri: redirectUrl,
            clientSecret: clientSecret,
            scopes: ["offline_access api:inventory:read"],
            codeChallenge: codeChallenge!,
            codeVerifier: codeVerifier!
        )
        
        return request
    }
    
    public func generateCodeVerifier() -> String? {
         var buffer = [UInt8](repeating: 0, count: 32)
         _ = SecRandomCopyBytes(kSecRandomDefault, buffer.count, &buffer)
        let codeVerifier = Data(buffer).base64EncodedString()
             .replacingOccurrences(of: "+", with: "-")
             .replacingOccurrences(of: "/", with: "_")
             .replacingOccurrences(of: "=", with: "")
             .trimmingCharacters(in: .whitespaces)

         return codeVerifier
     }

     /// Generating a code challenge for PKCE
     public func generateCodeChallenge(codeVerifier: String?) -> String? {
         guard let verifier = codeVerifier, let data = verifier.data(using: .utf8) else { return nil }

         #if !os(Linux)
         var buffer = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
         data.withUnsafeBytes {
             _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &buffer)
         }
         let hash = Data(buffer)
         #else
         let buffer = [UInt8](repeating: 0,  count: SHA256.byteCount)
         let sha = Array(HMAC<SHA256>.authenticationCode(for: buffer, using: SymmetricKey(size: .bits256)))
         let hash = Data(sha)
         #endif

         let challenge = hash.base64EncodedString()
             .replacingOccurrences(of: "+", with: "-")
             .replacingOccurrences(of: "/", with: "_")
             .replacingOccurrences(of: "=", with: "")
             .trimmingCharacters(in: .whitespaces)

         return challenge
     }

    
    
}


enum LoadingState: String {
    case Loading = "Loading"
    case False = "False"
    case True = "True"
}

