//
//  SettingsView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 07/01/2023.
//

import Foundation
import SwiftUI

struct SettingsView: View {

    @Environment(\.managedObjectContext) var viewContext
    @State private var showGreeting = true

    @StateObject var vm: SettingsViewModel
    
    var body: some View {
        NavigationView
        {
            List {
                HStack {
                    VStack
                    {
                        HStack {
                            Text(AuthService.shared.getNameFromToken()).bold()
                            Spacer()
                        }.padding(.top, 16)
                        HStack {
                            Button("Log Out")
                            {
                                AuthService.shared.logout()
                            }
                            Spacer()
                        }.padding(.top, 2)
                        Spacer()
                    }
                }.listRowBackground(Color.clear)
                Section(header: Text("Location").fontWeight(.bold)) {
                    NavigationLink(vm.settings?.locationName ?? "", destination:
                        LocationsView(vm: LocationsViewModel(context: viewContext)).navigationTitle("Locations").padding(.bottom, 50)
                    )
                    Toggle("Remember Location", isOn: $showGreeting)
                }.font(.title2)
            }
            .background(.white)
            .navigationTitle("Settings")
        }
        .task {
            await vm.load()
        }
        .alert(Text(vm.errorMessage ?? "Unknown Error"), isPresented: $vm.hasError) {
            Button("OK", role: .cancel) { }
        }
    }
}
