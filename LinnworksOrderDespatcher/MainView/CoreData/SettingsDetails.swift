//
//  SettingsDetails.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 09/01/2023.
//

import Foundation
import CoreData

extension SettingsEntity: BaseModel {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.container.viewContext
    }
    
    static var all: NSFetchRequest<SettingsEntity> {
        let request = SettingsEntity.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
}
