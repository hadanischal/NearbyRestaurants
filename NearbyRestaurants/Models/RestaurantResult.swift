//
//  RestaurantResult.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation

// MARK: - RestaurantResult

struct RestaurantResult: Codable, Equatable {
//    let resultsFound, resultsStart, resultsShown: Int
    let restaurants: [RestaurantElement]
}

// MARK: - RestaurantElement

struct RestaurantElement: Codable, Equatable {
    let restaurant: RestaurantModel
}

// MARK: - RestaurantRestaurant

struct RestaurantModel: Codable, Equatable {
    let apikey, id, name: String
    let location: Location
    let switchToOrderMenu: Int
    let cuisines, timings: String
    let averageCostForTwo, priceRange: Int
    let currency: String
    let allReviewsCount: Int
    let photoCount: Int
    let thumb, url, featuredImage: String
    let photosUrl, menuUrl, eventsUrl: String

    let hasOnlineDelivery, isDeliveringNow: Int
    let storeType: String
    let includeBogoOffers: Bool
    let isTableReservationSupported, hasTableBooking: Int
    let phoneNumbers: String
    let establishment: [String]
}

// MARK: - Location

struct Location: Codable, Equatable {
    let address, locality, city: String
    let cityId: Int
    let latitude, longitude, zipcode: String
    let countryId: Int
    let localityVerbose: String
}
