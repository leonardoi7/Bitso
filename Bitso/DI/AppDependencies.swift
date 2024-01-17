//
//  AppDependencies.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import SwiftUI

class AppDependencies: ObservableObject {
    let networkService: NetworkServiceProtocol
    let databaseService: DatabaseServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(),
         databaseService: DatabaseServiceProtocol = DatabaseService()) {
        self.networkService = networkService
        self.databaseService = databaseService
    }
}
