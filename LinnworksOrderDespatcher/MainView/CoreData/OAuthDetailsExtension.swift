//
//  OAuthDetailsExtension.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 27/12/2022.
//

import Foundation
import CoreData

extension OAuthEntity: BaseModel {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.container.viewContext
    }
    
    static var all: NSFetchRequest<OAuthEntity> {
        let request = OAuthEntity.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
}
