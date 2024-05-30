//
//  OrdersView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 02/01/2023.
//

import Foundation
import SwiftUI

struct OrdersView: View {
    @StateObject var vm: OrdersViewModel
    @Environment(\.managedObjectContext) var viewContext
    @State private var selectedSortingOption: SortingOption = .receivedDateDesc

    var body: some View {
        NavigationView
        {
            VStack
            {
                Picker("Sort by", selection: $selectedSortingOption) {
                   ForEach(SortingOption.allCases) { option in
                       Text(option.rawValue).tag(option)
                   }
                }
                .pickerStyle(.navigationLink)
                .padding()
                
                List
                {
                    ForEach(sortedOrders, id: \.self, content: {
                        order in NavigationLink(destination: OrderFullView(vm: OrderFullViewModel(context: viewContext, order: order), barcodeTextField: "")) {
                            OrderPreviewView(order: order).background(.clear)
                        }
                    })
                }.task {
                    await vm.GetOpenOrders()
                }.refreshable {
                    await vm.Refresh()
                }
                .navigationTitle("Orders")
                .listRowBackground(Color.clear)
            }
           
        }
    }
    
    private var sortedOrders: [Order] {
        switch selectedSortingOption {
        case .receivedDateDesc:
            return vm.orders.sorted(by: { $0.generalInfo.formattedRecievedDate! < $1.generalInfo.formattedRecievedDate! })
        case .despatchByDateDesc:
            return vm.orders.sorted(by: { $0.generalInfo.formattedDespatchByDate! < $1.generalInfo.formattedDespatchByDate! })
        case .receivedDateAsc:
            return vm.orders.sorted(by: { $0.generalInfo.formattedRecievedDate! > $1.generalInfo.formattedRecievedDate! })
        case .despatchByDateAsc:
            return vm.orders.sorted(by: { $0.generalInfo.formattedDespatchByDate! > $1.generalInfo.formattedDespatchByDate! })
        }
    }
}

enum SortingOption: String, CaseIterable, Identifiable {
    case receivedDateDesc = "Received Date Desc"
    case despatchByDateDesc = "Despatch By Date Desc"
    case receivedDateAsc = "Received Date Asc"
    case despatchByDateAsc = "Despatch By Date Asc"
    
    var id: String { self.rawValue }
}
