//
//  LinnworksOrderDespatcherApp.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 06/12/2022.
//

import SwiftUI

@main
struct LinnworksOrderDespatcherApp: App {
    let viewContext = CoreDataManager.shared.container.viewContext

    var body: some Scene {
        WindowGroup {
            MainView(vm: MainViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
