//
//  DatabaseService.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import RealmSwift

class DatabaseService: DatabaseServiceProtocol {
    var realm: Realm?
    
    init() {
        do {
            realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error)")
        }
    }
    
    func saveArtwork(artworkData: Data) {
        let dataEntity = DataEntity()
        dataEntity.id = artworkData.id ?? 0
        dataEntity.apiModel = artworkData.apiModel
        dataEntity.apiLink = artworkData.apiLink
        dataEntity.isBoosted = artworkData.isBoosted
        dataEntity.title = artworkData.title
        dataEntity.mainReferenceNumber = artworkData.mainReferenceNumber
        dataEntity.hasNotBeenViewedMuch = artworkData.hasNotBeenViewedMuch
        dataEntity.boostRank = artworkData.boostRank
        dataEntity.dateStart = artworkData.dateStart
        dataEntity.dateEnd = artworkData.dateEnd
        
        
        saveDataEntity(dataEntity: dataEntity)
    }
    
    func loadArtworks() -> [Data]? {
        guard let realm = realm else {
            print("Realm is not initialized.")
            return nil
        }
        
        let dataEntities = realm.objects(DataEntity.self)
        if dataEntities.isEmpty {
            return nil
        }
        
        var artworksArray: [Data] = []
        
        for entity in dataEntities {
            let artworkData = Data(
                id: Int(entity.id),
                apiModel: entity.apiModel,
                apiLink: entity.apiLink,
                isBoosted: entity.isBoosted,
                title: entity.title,
                mainReferenceNumber: entity.mainReferenceNumber,
                hasNotBeenViewedMuch: entity.hasNotBeenViewedMuch,
                boostRank: entity.boostRank,
                dateStart: entity.dateStart,
                dateEnd: entity.dateEnd,
                dateDisplay: entity.dateDisplay,
                dateQualifierTitle: entity.dateQualifierTitle,
                dateQualifierID: entity.dateQualifierID,
                artistDisplay: entity.artistDisplay,
                imageID: entity.imageID
            )
            artworksArray.append(artworkData)
        }
        
        return artworksArray
    }
    
    func clearDatabase() {
        guard let realm = realm else {
            print("Realm is not initialized.")
            return
        }
        
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Error clearing database: \(error)")
        }
    }
    
    private func saveDataEntity(dataEntity: DataEntity) {
        guard let realm = realm else {
            print("Realm is not initialized.")
            return
        }
        
        do {
            try realm.write {
                realm.add(dataEntity, update: .modified)
            }
        } catch {
            print("Error saving dataEntity to Realm: \(error)")
        }
    }

}

