//
// BatchResponseItems.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct BatchResponseItems: Codable {

    public enum Result: String, Codable { 
        case successful = "SUCCESSFUL"
        case failed = "FAILED"
    }
    public var item: UUID?
    public var result: Result?
    public var message: String?
    public var links: BatchResponseLinks?

    public init(item: UUID? = nil, result: Result? = nil, message: String? = nil, links: BatchResponseLinks? = nil) {
        self.item = item
        self.result = result
        self.message = message
        self.links = links
    }

    public enum CodingKeys: String, CodingKey { 
        case item = "Item"
        case result = "Result"
        case message = "Message"
        case links = "Links"
    }

}
