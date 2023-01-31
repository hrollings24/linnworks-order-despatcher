//
//  OAuth2Models.swift
//  SimpleOAuth2
//
//  Created by Hadi on 04/12/2020.
//

import Foundation

public struct OAuth2Credentials: Codable {
    var access_token: String
    var token_type: String?
    var refresh_token: String?
    var scope: String?
    var expires_in: Int?
}

public struct OAuth2Request {
    let authUrl: String
    let tokenUrl: String
    let clientId: String
    let redirectUri: String
    let clientSecret: String
    let scopes: [String]
    let codeChallenge: String
    let codeVerifier: String
    
    public init(authUrl: String,
                tokenUrl: String,
                clientId: String,
                redirectUri: String,
                clientSecret: String,
                scopes: [String],
                codeChallenge: String,
                codeVerifier: String) {
        self.authUrl = authUrl
        self.tokenUrl = tokenUrl
        self.clientId = clientId
        self.redirectUri = redirectUri
        self.clientSecret = clientSecret
        self.scopes = scopes
        self.codeChallenge = codeChallenge
        self.codeVerifier = codeVerifier
    }
}
