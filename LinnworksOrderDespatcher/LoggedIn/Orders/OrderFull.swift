//
//  OrderFull.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 14/01/2023.
//

import Foundation
import SwiftUI
import CodeScanner
import CoreData

struct OrderFullView: View {
    @StateObject var vm: OrderFullViewModel
    @State var barcodeTextField: String

    var body: some View {
        ZStack {
            VStack
            {
                HStack
                {
                    Text("Items: " + String(vm.order.totalItemsSum)).font(.subheadline)
                    Spacer()
                }.padding()
                HStack
                {
                    Button("Pick Items") {
                        vm.isShowingScanner = true
                    }
                    Button("Despatch Order") {
                        vm.despatchOrder()
                    }
                }
                if (vm.isShowingScanner)
                {
                    TextField("Enter barcode number", text: $barcodeTextField)
                        .onSubmit {
                            vm.handleBarcodeTextInput(barcodeNumber: barcodeTextField)
                        }
                        .border(Color.gray)
                    CodeScannerView(codeTypes: [.code128], simulatedData: "1020134", completion: vm.handleScan).frame(height: 200)
                }
                List
                {
                    if (vm.loaded)
                    {
                        ForEach(vm.order.items, id: \.self, content: { item in
                            let inventoryItem = vm.items.filter({$0._id?.uuidString.lowercased() == item.stockItemID.lowercased()})
                            ItemListElementView(item: inventoryItem[0], orderItem: item, pickedData: vm.itemsPicked[inventoryItem[0]._id!]!)
                        })
                    }

                }
            }.navigationTitle(String(vm.order.numOrderID))
            .task {
                await vm.load()
            }.alert(Text(vm.errorMessage), isPresented: $vm.hasError) {
                Button("OK", role: .cancel) { vm.hasError = false }
            }
            if (vm.displayQuantityAlert)
            {
                ItemQuantityPickerAlert(parentOrderFullViewModel: vm)
            }
        }
    }
    
    
}

//
//
//struct OrderFullView_Previews: PreviewProvider {
//    static var previews: some View {
//        let order = GetTestOrder()!
//        OrderFullView(vm: OrderFullViewModel(context: viewContext, order: order))
//    }
//}
