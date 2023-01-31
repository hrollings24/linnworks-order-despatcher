//
//  OAuth2+Extensions.swift
//  SimpleOAuth2
//
//  Created by Hadi on 04/12/2020.
//

import Foundation

public extension OAuth2Credentials {
    private static let key = "OAuth2CredentialsKey"

    func save() {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = .prettyPrinted
        let data = try? encoder.encode(self)
        UserDefaults.standard.set(data, forKey: OAuth2Credentials.key)
    }
    
    static func load() -> OAuth2Credentials? {
        guard let credentialsData = UserDefaults.standard.data(forKey: key),
              let credentials = try? JSONDecoder.current.decode(OAuth2Credentials.self, from: credentialsData) else { return nil }
        return credentials
    }
}

extension OAuth2Request {
    func buildAuthURL() -> URL {
        let queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: redirectUri),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "code_challenge", value: codeChallenge),
            URLQueryItem(name: "code_challenge_method", value: "S256"),
            URLQueryItem(name: "scope", value: scopes.joined(separator: " "))
        ]
        
        var components = URLComponents(string: authUrl)!
        components.queryItems = queryItems
        return components.url!
    }
    
    func buildTokenURL(code: String) -> URLRequest {
        let requestHeaders: [String: String] = ["Content-Type": "application/x-www-form-urlencoded"]
        var components = URLComponents()
        
        let queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "client_secret", value: clientSecret),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "code_verifier", value: codeVerifier),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "redirect_uri", value: redirectUri)
        ]
        components.queryItems = queryItems

        var request = URLRequest(url: URL(string: tokenUrl)!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = components.query?.data(using: .utf8)
        
        return request
    }
    
    func buildRefreshURL(refreshToken: String) -> URLRequest {
        let requestHeaders: [String: String] = ["Content-Type": "application/x-www-form-urlencoded"]
        var components = URLComponents()
        
        let queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "client_secret", value: clientSecret),
            URLQueryItem(name: "refresh_token", value: refreshToken),
            URLQueryItem(name: "grant_type", value: "refresh_token"),
        ]
        components.queryItems = queryItems

        var request = URLRequest(url: URL(string: tokenUrl)!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = components.query?.data(using: .utf8)
        
        return request
    }
}


extension JSONDecoder {
    static var current: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
