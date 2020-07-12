//
//  RestaurantListModel.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation

struct RestaurantListModel: Equatable {
    let id, name, url: String
    let address: String
    let imageUrl: String
}

extension RestaurantListModel {
    init(_ data: RestaurantModel) {
        id = data.id
        name = data.name
        url = data.url
        address = "\(data.location.address) , \(data.location.city)"
        imageUrl = data.featuredImage // photosUrl //photosUrl
    }

    init(_ data: Restaurant) {
        id = "\(data.collectionId)"
        name = data.title
        url = data.url
        address = data.description
        imageUrl = data.imageUrl
    }
}
