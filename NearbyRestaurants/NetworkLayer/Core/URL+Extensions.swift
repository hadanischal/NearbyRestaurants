//
//  URL+Extensions.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation

extension URL {
    static var sourcesUrl: URL? { URL(string: ApiConstant.baseServerURL) }
    static var searchUrl: URL? { URL(string: ApiConstant.baseServerURL + ApiConstant.search) }
    static var collectionsUrl: URL? { URL(string: ApiConstant.baseServerURL + ApiConstant.collections) }
}

struct ApiConstant {
    // For server URL
    static let baseServerURL = "https://developers.zomato.com/api/v2.1/"
    static let search = "search" // ?count=10&lat=37.8230&lon=144.9980&sort=rating"
    static let collections = "collections" // ?count=10&lat=37.8230&lon=144.9980"
}

struct Environment {
    struct Variables {
        static let zomatoApiKey = "87877a1c8bdee5c2cb7f4f23bab42b0c"
    }
}

struct ApiKey {
    static let count = "count"
    static let sort = "sort"
    static let lat = "lat"
    static let lon = "lon"
    static let radius = "radius"
}
