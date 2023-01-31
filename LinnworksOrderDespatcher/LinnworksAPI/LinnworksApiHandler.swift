//
//  LinnworksApiService.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 15/01/2023.
//

import Foundation

class LinnworksApiHandler {
    
    private var accessToken: String

    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    public func GetLocations() async throws -> [Location] {
        let api = LocationsAPI(token: accessToken)
        return try await withCheckedThrowingContinuation { continuation in
            api.locationsGet(completion: { data, error in
                do {
                    guard let locationsArray = data else {
                        throw LinnworksApiError.noData
                    }
                    continuation.resume(returning: locationsArray)

                }
                catch {
                    continuation.resume(throwing: error)
                }
            })
        }
    }
    
    public func GetInventoryItems(ids: [String]) async throws -> [InventoryItem] {
        
        let api = InventoryAPI(token: accessToken)
        return try await withCheckedThrowingContinuation { continuation in
            api.getInventoryItems(ids: ids.joined(separator: ","), completion: { data, error in
                do {
                    guard let items = data else {
                        throw LinnworksApiError.noData
                    }
                    continuation.resume(returning: items)

                }
                catch {
                    continuation.resume(throwing: error)
                }
            })
        }
    }
    
    public func GetOpenOrders(forLocation: UUID) async throws -> OpenOrderResponse {
        
        let json: [String: Any] = ["ViewId": 1,"LocationId": forLocation.uuidString, "EntriesPerPage": 100, "PageNumber": 1, "OrderIds": []]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        guard let url = URL(string: "https://dev-eu-ext.linnworks.net/api/OpenOrders/GetOpenOrders") else { throw LinnworksApiError.invalidUrl }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, _) = try await URLSession.shared.data(for: request)

       let result = try JSONDecoder().decode(OpenOrderResponse.self, from: data)
       return result
    }
    
}
