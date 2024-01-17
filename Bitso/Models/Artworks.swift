//
//  Artworks.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

struct Artworks: Codable {
    var pagination: Pagination?
    var data: [Data]?
    var info: Info?
    var config: Config?
}
