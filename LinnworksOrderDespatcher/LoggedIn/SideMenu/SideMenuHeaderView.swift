//
//  SideMenuHeaderView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 19/12/2022.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: {
                withAnimation(.spring()) {
                    showMenu.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })
            
            VStack(alignment: .leading) {
                Image("IMG_0700")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text(AuthService.shared.getNameFromToken())
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.bottom, 1)
                
                HStack(spacing: 12)
                {
                    Button("Log Out")
                    {
                        AuthService.shared.logout()
                    }
                    .font(.system(size: 18))
                    Spacer()
                }

                
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(showMenu: .constant(true))
    }
}
