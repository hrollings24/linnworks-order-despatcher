//
//  MainViewModel.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 06/12/2022.
//

import Foundation
import CoreData
import Combine

@MainActor
class MainViewModel: ObservableObject {
    
    @Published var CurrentLoggedInState: LoadingState
    @Published var CurrentLocationState: LoadingState

    private var cancellables = Set<AnyCancellable>()
    var oauthManager: OAuthService

    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext)
    {
        self.context = context
        self.oauthManager = OAuthService(context: context)
        self.CurrentLoggedInState = AuthService.shared.loggedIn
        self.CurrentLocationState = SettingsDataService.shared.locationState

        AuthService.shared.$loggedIn
                .sink(receiveValue: {
                    print($0)
                    self.CurrentLoggedInState = $0
                })
                .store(in: &cancellables)
        
        SettingsDataService.shared.$locationState
            .sink(receiveValue: {
                print($0)
                self.CurrentLocationState = $0
            })
            .store(in: &cancellables)
    }
    
    func launchAuth() async {
        do {
            try await oauthManager.SignInProper()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
