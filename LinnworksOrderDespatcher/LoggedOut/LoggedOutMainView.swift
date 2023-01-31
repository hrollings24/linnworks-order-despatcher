//
//  LoggedOutMainView.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 06/12/2022.
//

import SwiftUI

struct LoggedOutMainView: View {
    var body: some View {
        Button("Log In with Linnworks", role: .cancel)
        {
            //vm.loggedIn = true
        }
    }
}


struct LoggedOutMainView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedOutMainView()
    }
}
