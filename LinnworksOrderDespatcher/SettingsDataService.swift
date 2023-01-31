//
//  SettingsDataService.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 09/01/2023.
//

import Foundation
import CoreData
import JWTDecode

class SettingsDataService: NSObject, NSFetchedResultsControllerDelegate{
    
    static let shared = SettingsDataService()
    
    var settingsData: [SettingsEntity] = []
    @Published var locationState: LoadingState = LoadingState.Loading

    private var fetchResultsController: NSFetchedResultsController<SettingsEntity>
    
    override init() {
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: SettingsEntity.all, managedObjectContext: CoreDataManager.shared.container.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        self.fetchResultsController.delegate = self
        self.loadSettingsFromCoreData()
    }
        
    func loadSettingsFromCoreData() {
        do {
            try fetchResultsController.performFetch()
            settingsData = fetchResultsController.fetchedObjects ?? []
            print(settingsData)
            locationState = settingsData.count >= 1 ? LoadingState.True : LoadingState.False
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getSettings() throws -> SettingsEntity {
        do {
            try fetchResultsController.performFetch()
            settingsData = fetchResultsController.fetchedObjects ?? []
            print(settingsData)
            locationState = settingsData.count >= 1 ? LoadingState.True : LoadingState.False
            return settingsData[0]
        }
        catch {
            throw error
        }
    }
}
