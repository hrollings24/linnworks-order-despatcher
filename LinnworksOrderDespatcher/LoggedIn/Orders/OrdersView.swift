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

    var body: some View {
        NavigationView
        {
            List
            {
                ForEach(vm.orders, id: \.self, content: {
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
