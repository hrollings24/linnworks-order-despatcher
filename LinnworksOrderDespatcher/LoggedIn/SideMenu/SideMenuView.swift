//
//  SideMenuView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 19/12/2022.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var currentView: SideMenuViewModel

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                //Header
                SideMenuHeaderView(showMenu: $showMenu)
                    .foregroundColor(.white)
                    .frame(height: 180)

                
                //Cell items
                ForEach(MenuViewOptions.allCases, id: \.self) { option in
                    SideMenuOptionView(viewModel: option).foregroundColor(.white).onTapGesture {
                        currentView.CurrentlyDisplayingView = option
                        withAnimation(.spring()) {
                            showMenu.toggle()
                        }
                    }
                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showMenu: .constant(true))
    }
}
