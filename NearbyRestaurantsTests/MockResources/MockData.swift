//
//  MockData.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

@testable import NearbyRestaurants
import XCTest

class MockData {
    func stubCollectionsResult() -> CollectionsResult? {
        guard let data = self.readJson(forResource: "collections") else {
            XCTAssert(false, "Can't get data from collections.json")
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result = try? decoder.decode(CollectionsResult.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse CollectionsResult results")
            return nil
        }
    }

    func stubRestaurantResult() -> RestaurantResult? {
        guard let data = self.readJson(forResource: "restaurants") else {
            XCTAssert(false, "Can't get data from restaurants.json")
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result = try? decoder.decode(RestaurantResult.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse RestaurantResult results")
            return nil
        }
    }

    func readJson(forResource fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            XCTFail("unable to read json")
            return nil
        }
    }

    func restaurantListFromCollectionsResult() -> [RestaurantListModel] {
        let restaurantList = stubCollectionsResult().map(\.collections).map { list -> [RestaurantListModel] in
            list.map { RestaurantListModel($0.collection) }
        }
        return restaurantList ?? []
    }

    func restaurantListFromRestaurantResult() -> [RestaurantListModel] {
        let restaurantList = stubRestaurantResult().map(\.restaurants).map { list -> [RestaurantListModel] in
            list.map { RestaurantListModel($0.restaurant) }
        }
        return restaurantList ?? []
    }
}
