//
//  NetworkServiceProtocol.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchArtworks(page: Int, limit: Int, completion: @escaping (Result<Artworks, Error>) -> Void)
}
