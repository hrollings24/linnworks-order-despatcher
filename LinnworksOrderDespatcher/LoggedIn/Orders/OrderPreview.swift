//
//  OrderPreview.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 13/01/2023.
//

import Foundation
import SwiftUI

struct OrderPreviewView: View {
    var order: Order
    
    var body: some View {
        VStack
        {
            HStack
            {
                Text(String(order.numOrderID)).font(.title2)
                Spacer()
            }
            HStack
            {
                Text("Items: " + String(order.totalItemsSum)).font(.subheadline)
                Spacer()
            }
            HStack
            {
                Text("Despatch By: " + order.generalInfo.formattedDespatchByDateString).font(.subheadline)
                Spacer()
            }
            HStack
            {
                Text("Recieved Date: " + order.generalInfo.formattedRecievedDateString).font(.subheadline)
                Spacer()
            }
        }
    }
}
