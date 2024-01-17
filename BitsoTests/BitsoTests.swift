//
//  BitsoTests.swift
//  BitsoTests
//
//  Created by leonardo on 17/01/24.
//

import XCTest
@testable import Bitso

class BitsoTests: XCTestCase {
    var bundle: Bundle!
    
    override func setUp() {
        super.setUp()
        bundle = Bundle(for: type(of: self))
    }
    
    func testLoadArtworksFromJSON() {
        guard let url = bundle.url(forResource: "Response", withExtension: "json") else {
            XCTFail("Missing file: Response.json")
            return
        }
        
        do {
            let data = try String(contentsOf: url).data(using: .utf8)
            let decoder = JSONDecoder()
            let artworks = try decoder.decode(Artworks.self, from: data!)
            
            XCTAssertNotNil(artworks.pagination, "Pagination data should not be nil")
            XCTAssertNotNil(artworks.data, "Artworks data should not be nil")
            XCTAssertGreaterThan(artworks.data?.count ?? 0, 0, "Artworks data should not be empty")
            XCTAssertEqual(artworks.data?.first?.id, 3816, "First artwork id should be 3816")
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
    }
}


