//
//  LinnworksAPIAdapter.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 04/01/2023.
//

import Foundation
import AuthenticationServices
import Combine
import CommonCrypto
import CoreData

public class LinnworksAPIAdapter {
    
    private var oauthDetails: OAuthEntity
    private var viewContext: NSManagedObjectContext
    private var linnworksApiService: LinnworksApiHandler
    
    init(oauthDetails: OAuthEntity, context: NSManagedObjectContext) {
        self.oauthDetails = oauthDetails
        self.viewContext = context
        self.linnworksApiService = LinnworksApiHandler(accessToken: oauthDetails.accessToken!)
    }
    
    
    public func GetLocations() async throws -> [Location] {
        return try await MakeAPICall { apiService in
            try await apiService.GetLocations()
        }
    }
    
    public func GetOpenOrders(forLocation: UUID) async throws -> OpenOrderResponse {
        return try await MakeAPICall { apiService in
            try await apiService.GetOpenOrders(forLocation: forLocation)
        }
    }
    
    public func GetInventoryItems(forItems: [String]) async throws -> [InventoryItem] {
        return try await MakeAPICall { apiService in
            try await apiService.GetInventoryItems(ids: forItems)
        }
    }
    
    
    private func MakeAPICall<T>(endpoint: (LinnworksApiHandler) async throws -> T) async throws -> T
    {
        var retryAttempts = 0;
        
        while (retryAttempts < 2)
        {
            retryAttempts += 1
            
            do {
                return try await endpoint(linnworksApiService)
            }
            catch {
                print(String(describing: error))
                //refresh token and try again
                do {
                    let result = try await AuthService.shared.RefreshToken()
                    linnworksApiService = LinnworksApiHandler(accessToken: result.access_token)
                    save(accessToken: result.access_token, refreshToken: result.refresh_token!)
                }
                catch {
                    //logout auth is broken!
                    print(error)
                }
            }
        }
        
        throw LinnworksApiError.unknown
    }
    
    func save(accessToken: String, refreshToken: String) {
        do{
            oauthDetails.accessToken = accessToken
            oauthDetails.refreshToken = refreshToken
            try oauthDetails.save()
        } catch {
            print(error)
        }
    }
}
