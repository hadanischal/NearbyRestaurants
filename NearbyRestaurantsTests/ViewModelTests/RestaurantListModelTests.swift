//
//  RestaurantListModelTests.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
import Nimble
import Quick
import XCTest

@testable import NearbyRestaurants

final class RestaurantListModelTests: QuickSpec {
    override func spec() {
        describe("RestaurantListModel test") {
            context("When set RestaurantListModel from RestaurantModel") {
                let restaurantModel: RestaurantModel! = MockData().stubRestaurantResult()?.restaurants.first?.restaurant
                var testModel: RestaurantListModel!

                beforeEach {
                    testModel = RestaurantListModel(restaurantModel)
                }

                it("it sets RestaurantListModel correctly") {
                    expect(testModel.id).to(equal(restaurantModel.id))
                    expect(testModel.name).to(equal(restaurantModel.name))
                    expect(testModel.url).to(equal(restaurantModel.url))
                    expect(testModel.address).to(equal("\(restaurantModel.location.address) , \(restaurantModel.location.city)"))
                    expect(testModel.imageUrl).to(equal(restaurantModel.featuredImage))
                }
            }

            context("When set RestaurantListModel from Restaurant") {
                let restaurant: Restaurant! = MockData().stubCollectionsResult()?.collections.first?.restaurant
                var testModel: RestaurantListModel!

                beforeEach {
                    testModel = RestaurantListModel(restaurant)
                }

                it("it sets RestaurantListModel correctly") {
                    expect(testModel.id).to(equal("\(restaurant.collectionId)"))
                    expect(testModel.name).to(equal(restaurant.title))
                    expect(testModel.url).to(equal(restaurant.url))
                    expect(testModel.address).to(equal(restaurant.description))
                    expect(testModel.imageUrl).to(equal(restaurant.imageUrl))
                }
            }
        }
    }
}
