//
//  LoggedInMainView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 06/12/2022.
//

import Foundation

import SwiftUI

struct LoggedInMainView: View {
    @State private var showMenu = false
    @StateObject var currentView: SideMenuViewModel = SideMenuViewModel()
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
//        NavigationView {
//            ZStack {
//                if showMenu
//                {
//                    SideMenuView(showMenu: $showMenu).environmentObject(currentView)
//                }
//                SelectView()
//                    .environmentObject(currentView)
//                    .cornerRadius(showMenu ? 20 : 10)
//                    .offset(x: showMenu ? 300 : 0, y: showMenu ? 44 : 0)
//                    .scaleEffect(showMenu ? 0.9 : 1)
//                    .onTapGesture {
//                        if (showMenu)
//                        {
//                            withAnimation(.spring()) {
//                                showMenu.toggle()
//                            }
//                        }
//                    }
//                    .navigationBarItems(leading: Button(action: {
//                        withAnimation(.spring()) {
//                            showMenu.toggle()
//                        }
//                    }, label: { Image(systemName: "list.bullet").foregroundColor(.black)
//                    })).navigationTitle(currentView.CurrentlyDisplayingView.title)
//            }.onAppear {
//                showMenu = false
//            }
//        }
        TabView {
            HomeView(HomeModel: HomeViewModel())
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            OrdersView(vm: OrdersViewModel(context: viewContext))
                .tabItem {
                    Label("Orders", systemImage: "cart")
                }
            
            SettingsView(vm: SettingsViewModel())
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}


struct SelectView: View {
    @EnvironmentObject var currentView: SideMenuViewModel
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
        if currentView.CurrentlyDisplayingView == .Home {
            HomeView(HomeModel: HomeViewModel())
        }
        else if currentView.CurrentlyDisplayingView == .Orders {
            OrdersView(vm: OrdersViewModel(context: viewContext))
        }
        else if currentView.CurrentlyDisplayingView == .Settings {
            SettingsView(vm: SettingsViewModel())
        }
    }
}

//
//struct LoggedInMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoggedInMainView()
//    }
//}
