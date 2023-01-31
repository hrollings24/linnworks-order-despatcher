//
//  OrderFullViewModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 15/01/2023.
//

import Foundation
import CoreData
import CodeScanner

@MainActor
class OrderFullViewModel: ObservableObject {
    @Published var order: Order
    @Published var items: [InventoryItem]
    @Published var loaded: Bool
    @Published var isShowingScanner: Bool
    @Published var itemsPicked: [UUID:CanDespatchModel]
    @Published var hasError: Bool
    @Published var errorMessage: String
    @Published var displayQuantityAlert: Bool

    var currentlyPickingItemId: UUID?
    
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext, order: Order) {
        viewContext = context
        self.order = order
        self.items = []
        self.loaded = false
        self.isShowingScanner = false
        self.itemsPicked = [:]
        self.hasError = false
        self.errorMessage = ""
        self.displayQuantityAlert = false
        self.currentlyPickingItemId = nil
    }
    
    func getCurrentItemPickMaxQuantity() -> Int
    {
        let orderItem = order.items.filter({$0.stockItemID.lowercased() == currentlyPickingItemId!.uuidString.lowercased()}).first
        
        if let val = itemsPicked[currentlyPickingItemId!] {
            return orderItem!.quantity - val.quantityPicked
        }
        
        return orderItem!.quantity
    }
    
    
    func load() async {
        let api = LinnworksAPIAdapter(oauthDetails: AuthService.shared.oauthDetails[0], context: viewContext)
        do {
            let itemArray = order.items.map{$0.stockItemID}
            items = try await api.GetInventoryItems(forItems: itemArray)
            items.forEach { item in
                itemsPicked[item._id!] = CanDespatchModel(fullyPicked: false, quantityPicked: 0)
            }
            loaded = true
        }
        catch {
            print(error)
        }
    }
    
    func confirmPick(quantity: Int) {
        let orderItem = order.items.filter({$0.stockItemID.lowercased() == currentlyPickingItemId!.uuidString.lowercased()}).first

        if let val = itemsPicked[currentlyPickingItemId!] {
            let newQuantity = val.quantityPicked + quantity
            itemsPicked[currentlyPickingItemId!] = CanDespatchModel(fullyPicked: newQuantity == orderItem?.quantity, quantityPicked: newQuantity)
        }
        else {
            itemsPicked[currentlyPickingItemId!] = CanDespatchModel(fullyPicked: quantity == orderItem?.quantity, quantityPicked: quantity)
        }
    }
    
    func handleFindingBarcode(barcodeNumber: String) {
        let item = items.filter { InventoryItem in
            InventoryItem.barcode == barcodeNumber
        }.first
        
        currentlyPickingItemId = item!._id!
        if (item != nil)
        {
            let orderItem = order.items.filter({$0.stockItemID.lowercased() == currentlyPickingItemId!.uuidString.lowercased()}).first
            if orderItem!.quantity > 1 {
                displayQuantityAlert = true
            }
            else {
                confirmPick(quantity: 1)
            }
        }
        else
        {
            errorMessage = "Item could not be found in this order"
            hasError = true
        }
    }
    
    func handleBarcodeTextInput(barcodeNumber: String) {
        handleFindingBarcode(barcodeNumber: barcodeNumber)
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false
        
        switch result {
            case .success(let result):
                handleFindingBarcode(barcodeNumber: result.string)
            
            case .failure(let error):
                errorMessage = error.localizedDescription
                hasError = true
        }
    }
    
    func despatchOrder() {
        let canDespatch = itemsPicked.values.allSatisfy { CanDespatchModel in
            CanDespatchModel.fullyPicked
        }
        
        if (!canDespatch)
        {
            errorMessage = "Please pick all items in the order before despatching"
            hasError = true
        } else {
            print("Call Despatch!")
        }
        
    }
}
