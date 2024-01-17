//
//  Datum.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

//"main_reference_number": "1966.116a-j",
//"has_not_been_viewed_much": true,
//"boost_rank": null,
//"date_start": 1789,
//"date_end": 1820,
//"date_display": "1789/1820",
//"date_qualifier_title": "",
//"date_qualifier_id": null,
//        "artist_display": "Martin-Guillaume Biennais\nFrench, 1764-1843\nPierre-Benoît Lorillon\nFrench, 1757-1816\nParis, France",

import Foundation

struct Data: Codable, Identifiable {
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
