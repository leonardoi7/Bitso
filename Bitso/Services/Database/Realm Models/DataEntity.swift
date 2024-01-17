//
//  DataEntity.swift
//  Bitso
//
//  Created by leonardo on 16/01/24.
//

import RealmSwift

class DataEntity: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var apiModel: String?
    @Persisted var apiLink: String?
    @Persisted var isBoosted: Bool?
    @Persisted var title: String?
    @Persisted var mainReferenceNumber: String?
    @Persisted var hasNotBeenViewedMuch: Bool?
    @Persisted var boostRank: Int?
    @Persisted var dateStart: Int?
    @Persisted var dateEnd: Int?
    @Persisted var dateDisplay: String?
    @Persisted var dateQualifierTitle: String?
    @Persisted var dateQualifierID: Int?
    @Persisted var artistDisplay: String?
    @Persisted var imageID: String?
    
    @Persisted var page: Int
}
