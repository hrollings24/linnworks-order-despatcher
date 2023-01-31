//
//  CountriesListView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 07/01/2023.
//

import Foundation
import SwiftUI

struct LocationsView: View {
    @StateObject var vm: LocationsViewModel
    @State private var showingAlert = false

    var body: some View {
        List {
            ForEach(vm.locations, id: \.self, content: {
                location in Button(location.locationName!) {
                    showingAlert = true
                }
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Change location"),
                        message: Text("Confirm your location is " + (location.locationName ?? "Unknown")),
                        primaryButton: .default(Text("Confirm")) {
                            vm.save(locationId: location.stockLocationId!, locationName: location.locationName!)
                        },
                        secondaryButton: .cancel()
                    )
                }
            })
        }.task {
            await vm.load()
        }
    }
}
