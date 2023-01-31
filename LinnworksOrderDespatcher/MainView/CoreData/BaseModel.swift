//
//  BaseModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 27/12/2022.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get }
    func save() throws
    func delete() throws
}

extension BaseModel where Self: NSManagedObject {

    func save() throws {
        try Self.viewContext.save()
    }

    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}
