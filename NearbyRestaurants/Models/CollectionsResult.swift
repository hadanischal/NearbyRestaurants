//
//  RestaurantResult.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 7/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation

// MARK: - CollectionsResult

struct CollectionsResult: Codable, Equatable {
    let collections: [CollectionElement]
    let hasMore: Int
    let shareUrl: String
    let displayText: String
    let hasTotal: Int
    let userHasAddresses: Bool
}

// MARK: - CollectionElement

struct CollectionElement: Codable, Equatable {
    let restaurant: Restaurant

    enum CodingKeys: String, CodingKey {
         case restaurant = "collection"
     }
}

// MARK: - CollectionCollection

struct Restaurant: Codable, Equatable {
    let collectionId, resCount: Int
    let imageUrl: String
    let url: String
    let title, description: String
    let shareUrl: String
}
