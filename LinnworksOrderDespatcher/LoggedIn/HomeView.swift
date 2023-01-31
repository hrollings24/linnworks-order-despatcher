//
//  HomeView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 02/01/2023.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var HomeModel: HomeViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack
            {
                VStack {
                    HStack
                    {
                        Text("I am the home view").padding()
                        Spacer()
                    }
                    Spacer()
                }
            }.background(.white).navigationTitle("Home")
        }
    }
}
