//
// InlineResponse500.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct InlineResponse500: Codable {

    public enum ErrorCode: String, Codable { 
        case unexpectedServerError = "UNEXPECTED_SERVER_ERROR"
    }
    public var errorCode: ErrorCode?
    public var errorDescription: String?

    public init(errorCode: ErrorCode? = nil, errorDescription: String? = nil) {
        self.errorCode = errorCode
        self.errorDescription = errorDescription
    }


}
