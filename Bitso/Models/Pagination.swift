//
//  Pagination.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

struct Pagination: Codable {
    var total, limit, offset, totalPages: Int?
    var currentPage: Int?
    var nextURL: String?
}
