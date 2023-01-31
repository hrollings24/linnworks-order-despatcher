//
//  ContentView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 06/12/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm: MainViewModel
        
    @Environment(\.managedObjectContext) var viewContext
    
    
    init(vm: MainViewModel)
    {
        self.vm = vm
    }
    
    var body: some View {
        ZStack
        {
            if (vm.CurrentLoggedInState == LoadingState.Loading ||  vm.CurrentLocationState == LoadingState.Loading)
            {
                Text("Loading")
            }
            else if (vm.CurrentLoggedInState == LoadingState.True && vm.CurrentLocationState == LoadingState.True)
            {
                LoggedInMainView()
            }
            else if (vm.CurrentLoggedInState == LoadingState.True && vm.CurrentLocationState == LoadingState.False)
            {
                NavigationView {
                    LocationsView(vm: LocationsViewModel(context: viewContext)).navigationTitle("Select Location")
                }
            }
            else
            {
                Button("Log In", role: .cancel)
                {
                    Task {
                        await vm.launchAuth()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.container.viewContext
        MainView(vm: MainViewModel(context: viewContext))
    }
}
