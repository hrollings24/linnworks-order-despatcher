//
// BatchResponseLinks.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct BatchResponseLinks: Codable {

    public enum ModelType: String, Codable {
        case _get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    public var type: ModelType?
    public var href: String?

    public init(type: ModelType? = nil, href: String? = nil) {
        self.type = type
        self.href = href
    }

    public enum CodingKeys: String, CodingKey {
        case type = "Type"
        case href = "Href"
    }

}
