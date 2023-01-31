//
//  SettingsViewModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 10/01/2023.
//

import Foundation


@MainActor
public class SettingsViewModel: ObservableObject {

    @Published var errorMessage: String?
    @Published var settings: SettingsEntity?
    @Published var hasError = false
    @Published var toggled = false

    init()
    {
        errorMessage = nil
        settings = nil
    }
    
    func load() async {
        do
        {
            settings = try SettingsDataService.shared.getSettings()
        }
        catch
        {
            hasError = true
            errorMessage = error.localizedDescription
        }
    }
}

