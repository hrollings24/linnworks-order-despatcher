//
//  SideMenuViewModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 19/12/2022.
//

import Foundation

enum MenuViewOptions: Int, CaseIterable {
    case Home
    case Orders
    case Settings
    
    var title: String {
        switch self {
        case .Home: return "Home"
        case .Orders: return "Orders"
        case .Settings: return "Settings"
        }
    }
}
