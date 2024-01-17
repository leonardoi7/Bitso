//
//  Datum.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import Foundation

struct Data: Codable, Identifiable, Equatable {
    static func == (lhs: Data, rhs: Data) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int?
    var apiModel: String?
    var apiLink: String?
    var isBoosted: Bool?
    var title: String?
    var altTitles: [String]?
    var thumbnail: Thumbnail?
    var mainReferenceNumber: String?
    var hasNotBeenViewedMuch: Bool?
    var boostRank: Int?
    var dateStart: Int?
    var dateEnd: Int?
    var dateDisplay: String?
    var dateQualifierTitle: String?
    var dateQualifierID: Int?
    var artistDisplay: String?
    var imageID: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case apiModel = "model"
        case apiLink = "api_link"
        case isBoosted = "is_boosted"
        case title = "title"
        case altTitles = "alt_titles"
        case thumbnail = "thumbnail"
        case mainReferenceNumber = "main_reference_number"
        case hasNotBeenViewedMuch = "has_not_been_viewed_much"
        case boostRank = "boost_rank"
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case dateDisplay = "date_display"
        case dateQualifierTitle = "date_qualifier_title"
        case dateQualifierID = "date_qualifier_id"
        case artistDisplay = "artist_display"
        
        case imageID = "image_id"
    }
}
