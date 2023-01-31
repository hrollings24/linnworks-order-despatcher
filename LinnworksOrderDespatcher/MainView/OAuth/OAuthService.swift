//
//  OAuthService.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 27/12/2022.
//

import Foundation
import AuthenticationServices
import Combine
import CommonCrypto
import CoreData


public class OAuthService: NSObject, ASWebAuthenticationPresentationContextProviding {

    private var subscriptions: [AnyCancellable] = []
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        viewContext = context
    }
    
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        
        return ASPresentationAnchor()
    }
    
    public func SignInProper() async throws
    {
        try await signIn(with: AuthService.shared.getRequest())
    }
    
    public func signIn(with request: OAuth2Request) async throws {
    
        guard let components = URLComponents(string: request.redirectUri), let callbackScheme = components.scheme else {
            throw OAuth2Error.invalidRedirectUri
        }
            
        try await self.requestAuthAsync(request: request, callbackScheme: callbackScheme)

    }

    func requestAuthAsync(request: OAuth2Request, callbackScheme: String) async throws {
                                        
        let authSession = ASWebAuthenticationSession(url: request.buildAuthURL(), callbackURLScheme: callbackScheme, completionHandler: { (callbackURL, error) in
            guard error == nil, let successURL = callbackURL else {
               print("Nothing")
               return
            }

            let authorizationToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "code"}).first?.value
            
            //self.requestTokenFaked(for: request.buildTokenURL(code: authorizationToken!))
            self.requestToken(for: request.buildTokenURL(code: authorizationToken!))
        })
        
        authSession.presentationContextProvider = self
        authSession.prefersEphemeralWebBrowserSession = true
        authSession.start()
        
    }
    
    func requestToken(for request: URLRequest) {
        
        let sessionDelegate = HTTPRequestDelegate()
        let session = URLSession(configuration: .default,
                                         delegate:  sessionDelegate,
                                         delegateQueue: nil)
        
        
        let task = session.dataTask(with: request) { [self] data, response, error in
            if let error = error {
                // Handle the error
                print(String(describing: error))
                return
            }

            guard let data = data, let _ = response as? HTTPURLResponse else {
                // Handle the error
                print("Invalid response or data")
                return
            }

            let decoder = JSONDecoder()

            do {
                let oauthDetails = try decoder.decode(OAuth2Credentials.self, from: data)
                self.save(accessToken: oauthDetails.access_token, refreshToken: oauthDetails.refresh_token!)
                AuthService.shared.loadTokensFromCoreData()
            } catch {
                print(String(describing: error)) // <- ✅ Use this for debuging!
            }
        }

        task.resume()
    }
    
    
    func save(accessToken: String, refreshToken: String) {
        do{
            let oauthDetails = OAuthEntity(context: viewContext)
            oauthDetails.accessToken = accessToken
            oauthDetails.refreshToken = refreshToken
            try oauthDetails.save()
        } catch {
            print(error)
        }
    }
    
    
}

public class HTTPRequestDelegate: NSObject, URLSessionDelegate
{
    // Get Challenged twice, 2nd time challenge.protectionSpace.serverTrust is nil, but works!
    public func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.serverTrust != nil {
            completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        } else {
            completionHandler(.useCredential, nil)
        }
    }
}

