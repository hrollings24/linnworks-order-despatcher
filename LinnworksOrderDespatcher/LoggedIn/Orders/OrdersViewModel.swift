//
//  OrdersViewModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 12/01/2023.
//

import Foundation
import CoreData

@MainActor
public class OrdersViewModel: ObservableObject {

    @Published var orders: [Order]
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        viewContext = context
        orders = []
    }
    
    
    public func GetOpenOrders() async {
        
        let api = LinnworksAPIAdapter(oauthDetails: AuthService.shared.oauthDetails[0], context: viewContext)
        do {
            orders = try await api.GetOpenOrders(forLocation: SettingsDataService.shared.settingsData[0].locationId!).data
        }
        catch {
            print(error)
        }
    }
    
    public func Refresh() async {
        orders = []
        await GetOpenOrders()
    }
    
}
