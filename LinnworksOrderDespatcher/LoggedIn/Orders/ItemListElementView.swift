//
//  ItemPicker.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 14/01/2023.
//

import SwiftUI

struct ItemListElementView: View {
    var item: InventoryItem
    var orderItem: Item
    var pickedData: CanDespatchModel

    var body: some View {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text(.init("**SKU** " + (item.SKU ?? "Loading...")))
                Text(.init("**Barcode** " + (item.barcode ?? "Loading...")))
                Text(.init("**Quantity** " + String(orderItem.quantity)))
            }
            AsyncImage(url: URL(string: "https://cdn.shopify.com/s/files/1/0026/4578/6742/products/womens-100-silk-socks-silver-3-7-clothing-the-wool-company-467617_1500x.jpg?v=1636459342")) { image in image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: { Color.gray }
                .frame(width: 48, height: 48)
            Spacer()
            if pickedData.fullyPicked {
                Image(systemName: "checkmark.circle.fill")
            }
            else {
                Text(String(pickedData.quantityPicked))
            }
        }
    }
}
