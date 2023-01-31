//
//  SideMenuOptionView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 19/12/2022.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: MenuViewOptions
     
    var body: some View {
        HStack(spacing: 16) {
           Image(systemName: "person")
                .frame(width: 24, height: 24)
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }.padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .Orders)
    }
}
