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
    @State private var selectedLocation: Location?

    var body: some View {
        List {
            ForEach(vm.locations, id: \.self, content: {
                location in Button(location.locationName!) {
                    selectedLocation = location // Set the selected location
                    showingAlert = true
                }
            })
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Change location"),
                    message: Text("Confirm your location is " + (selectedLocation?.locationName ?? "Unknown")),
                    primaryButton: .default(Text("Confirm")) {
                        if let location = selectedLocation {
                            vm.save(locationId: location.stockLocationId!, locationName: location.locationName!)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }.task {
            await vm.load()
        }
    }
}
