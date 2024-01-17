//
//  NetworkService.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    func fetchArtworks(page: Int = 1, limit: Int = 12, completion: @escaping (Result<Artworks, Error>) -> Void) {
        let urlString = "https://api.artic.edu/api/v1/artworks?page=\(page)&limit=\(limit)"
        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let artworks = try JSONDecoder().decode(Artworks.self, from: data)
                completion(.success(artworks))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

