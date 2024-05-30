//
//  SettingsViewModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 07/01/2023.
//

import Foundation
import Combine
import CoreData

@MainActor
public class LocationsViewModel: NSObject, ObservableObject {

    @Published var locations: [Location]
    
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        viewContext = context
        locations = []
    }

    func load() async {
        let api = LinnworksAPIAdapter(oauthDetails: AuthService.shared.oauthDetails[0], context: viewContext)
        do {
            locations = try await api.GetLocations()
            print(locations)
        }
        catch {
            print(error)
        }
    }
    
    func save(locationId: UUID, locationName: String) {
        do{
            
            //we should edit the settings object here, instead of creating a new one!
            
            SettingsDataService.shared.settingsData.first?.locationId = locationId
            SettingsDataService.shared.settingsData.first?.locationName = locationName

            try SettingsDataService.shared.settingsData.first?.save()
            SettingsDataService.shared.locationState = .True
        } catch {
            print(error)
        }
    }


}
