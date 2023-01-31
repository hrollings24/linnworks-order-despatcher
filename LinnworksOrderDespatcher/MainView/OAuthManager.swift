//
//  OAuthManager.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 20/12/2022.
//



//
//  OAuth2Manager.swift
//  SimpleOAuth2
//
//  Created by Hadi on 04/12/2020.
//

import AuthenticationServices
import Combine
import Foundation
import CommonCrypto

public class OAuth2Manager: NSObject, ASWebAuthenticationPresentationContextProviding {

    private var subscriptions: [AnyCancellable] = []
    
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
    
    
    
//    public func signInAsync(with request: OAuth2Request) async throws -> OAuth2Credentials {
//
//        guard let components = URLComponents(string: request.redirectUri), let callbackScheme = components.scheme else {
//            throw OAuth2Error.invalidRedirectUri
//        }
//
//        self.requestAuth(url: request.buildAuthURL(), callbackScheme: callbackScheme)
//            .flatMap { self.requestToken(for: request.buildTokenURL(code: $0)) }
//            .
//
//
//        self.requestAuth(url: request.buildAuthURL(), callbackScheme: callbackScheme)
//            .flatMap { self.requestToken(for: request.buildTokenURL(code: $0)) }
//            .sink { (result) in
//                switch result {
//                    case .failure(let error):
//                        completion(.failure(error))
//                    default:
//                        break
//                }
//            } receiveValue: { credential in
//                return completion(credential)
//            }
//            .store(in: &self.subscriptions)
//    }
    
    
    
//    public func SignInProper()
//    {
//        signIn(with: getRequest()).sink(receiveCompletion: { errorResult in
//            switch errorResult {
//            case .failure(let error):
//                print(error.localizedDescription)
//            default: break
//            }
//        }, receiveValue: { credentuaks in
//            print(credentuaks)
//        })
//        .store(in: &self.subscriptions)
//    }
    
    public func SignInProper() async throws
    {
        try await signIn(with: getRequest())
    }
    
    

//    public func signIn(with request: OAuth2Request) -> Future<OAuth2Credentials, Error> {
//        return Future { [weak self] completion in
//            guard let self = self else { return }
//            guard let components = URLComponents(string: request.redirectUri),
//                  let callbackScheme = components.scheme else {
//                completion(.failure(OAuth2Error.invalidRedirectUri))
//                return
//            }
//
//            self.requestAuth(url: request.buildAuthURL(), callbackScheme: callbackScheme)
//                .flatMap { self.requestToken(for: request.buildTokenURL(code: $0)) }
//                .sink { (result) in
//                    switch result {
//                    case .failure(let error):
//                        completion(.failure(error))
//                    default: break
//                    }
//                } receiveValue: { credential in
//                    completion(.success(credential))
//                }
//                .store(in: &self.subscriptions)
//        }
//    }
//
//
    
    public func signIn(with request: OAuth2Request) async throws {
    
        guard let components = URLComponents(string: request.redirectUri), let callbackScheme = components.scheme else {
            throw OAuth2Error.invalidRedirectUri
        }
            
        try await self.requestAuthAsync(request: request, callbackScheme: callbackScheme)

    }
    
    
    
    
    
    public func getRequest() -> OAuth2Request
    {
        let codeVerifier = generateCodeVerifier()
        let codeChallenge = generateCodeChallenge(codeVerifier: codeVerifier)
        
        let request: OAuth2Request = OAuth2Request(authUrl: "https://dev-login.linnworks.net/connect/authorize",
                                           tokenUrl: "https://dev-login.linnworks.net/connect/token?environment_type=DEV",
                                           clientId: "ext_app_cfbf8a3a-a6d7-4b85-98e2-ab9de81cf901",
                                           redirectUri: "modeflick.SimpleOAuth2://dev-login.linnworks.net/ios/modeflick.SimpleOAuth2",
                                           clientSecret: "2bb0b575-8144-476d-b5f2-91265c44c7e0",
                                           scopes: ["offline_access api:inventory:read"],
                                           codeChallenge: codeChallenge!,
                                                   codeVerifier: codeVerifier!)
        
        return request
    }
}

private extension OAuth2Manager {
    
    func requestAuthAsync(request: OAuth2Request, callbackScheme: String) async throws {
                                        
        let authSession = ASWebAuthenticationSession(url: request.buildAuthURL(), callbackURLScheme: callbackScheme, completionHandler: { (callbackURL, error) in
            guard error == nil, let successURL = callbackURL else {
               print("Nothing")
               return
            }

            let authorizationToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "code"}).first?.value
            
            //self.requestToken(for: request.buildTokenURL(code: authorizationToken!))
            
        })
        
        authSession.presentationContextProvider = self
        authSession.prefersEphemeralWebBrowserSession = true
        authSession.start()
        
    }
    
    func requestTokenFaked(for url: URL)
    {
        
    }
  
    
    func requestToken(for url: URL) {
        var request =  URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

//        return URLSession.shared.dataTaskPublisher(for: request)
//            .tryMap { data, response in
//                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
//            .decode(type: OAuth2Credentials.self, decoder: JSONDecoder.current)
//            .eraseToAnyPublisher()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // Handle the error
                print(error)
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse else {
                // Handle the error
                print("Invalid response or data")
                return
            }

            // Process the response
            print(response)
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    
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
