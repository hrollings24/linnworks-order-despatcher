//
//  SideMenuViewModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 02/01/2023.
//

import Foundation

class SideMenuViewModel: ObservableObject {
    @Published var CurrentlyDisplayingView: MenuViewOptions = .Home
}
