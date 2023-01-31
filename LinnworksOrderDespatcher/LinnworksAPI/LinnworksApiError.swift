//
//  LinnworksApiError.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 15/01/2023.
//

import Foundation


public enum LinnworksApiError: String, LocalizedError {
    case unknown
    case invalidUrl
    case noData
    
    public var localizedDescription: String {
        switch self {
        case .unknown: return "Unknown error occured when communicating with Linnworks"
        case .invalidUrl: return "Could not communicate with Linnworks due to invalid API endpoint"
        case .noData: return "Result of API call was successful but no data was returned"
        }
    }
}

