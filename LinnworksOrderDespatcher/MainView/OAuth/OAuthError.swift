//
//  OAuth2Error.swift
//  SimpleOAuth2
//
//  Created by Hadi on 04/12/2020.
//

import Foundation

public enum OAuth2Error: String, LocalizedError {
    case invalidRedirectUri
    case noNameClaim
    
    public var localizedDescription: String {
        switch self {
        case .invalidRedirectUri: return "Invalid Redirect Uri"
        case .noNameClaim: return "Name could not be found in the jwt token"
        }
    }
}

