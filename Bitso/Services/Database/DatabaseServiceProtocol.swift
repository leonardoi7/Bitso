//
//  DatabaseServiceProtocol.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

protocol DatabaseServiceProtocol {
    func loadArtworks() -> [Data]?
    func saveArtwork(artworkData: Data)
    func clearDatabase()
}
