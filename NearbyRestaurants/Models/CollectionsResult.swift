//
//  RestaurantResult.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 7/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation

// MARK: - CollectionsResult

struct CollectionsResult: Codable {
    let collections: [CollectionElement]
    let hasMore: Int
    let shareUrl: String
    let displayText: String
    let hasTotal: Int
    let userHasAddresses: Bool
}

// MARK: - CollectionElement

struct CollectionElement: Codable {
    let collection: Restaurant
}

// MARK: - CollectionCollection

struct Restaurant: Codable {
    let collectionId, resCount: Int
    let imageUrl: String
    let url: String
    let title, description: String
    let shareUrl: String
}
