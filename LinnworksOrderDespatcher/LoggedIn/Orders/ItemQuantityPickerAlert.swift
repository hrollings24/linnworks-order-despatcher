//
//  ItemQuantityPickerAlert.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 17/01/2023.
//

import SwiftUI

struct ItemQuantityPickerAlert: View {
    @StateObject var parentOrderFullViewModel: OrderFullViewModel
    
    @State var quantitySelected: Int = 1
    
    var body: some View {
        ZStack
        {
            Color.black.opacity(0.3).ignoresSafeArea()
            
            VStack {
                Text("Enter Quantity").font(.title).bold().padding().padding(.trailing, 64).padding(.leading, 64)
                HStack {
                    Button {
                        quantitySelected -= 1
                    } label: {
                        Text("-").font(.title)
                    }.disabled(quantitySelected <= 1)
                    Text(String(quantitySelected)).font(.title).padding(.leading, 32).padding(.trailing, 31)
                    Button {
                        quantitySelected += 1
                    } label: {
                        Text("+").font(.title)
                    }.disabled(quantitySelected >= parentOrderFullViewModel.getCurrentItemPickMaxQuantity())
                }
                HStack {
                    Button {
                        parentOrderFullViewModel.confirmPick(quantity: quantitySelected)
                        parentOrderFullViewModel.displayQuantityAlert = false
                    } label: {
                        Text("Pick").font(.title)
                    }
                    Button {
                        parentOrderFullViewModel.displayQuantityAlert = false
                    } label: {
                        Text("Cancel").font(.title)
                    }
                }.padding()

            }.background(Color.white)
                .cornerRadius(25)
        }
    }
}

