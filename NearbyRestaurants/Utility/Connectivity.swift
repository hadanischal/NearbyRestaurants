//
//  Connectivity.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 12/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation
import Reachability

protocol ConnectivityHandler {
    var isConnectedToInternet: Bool { get }
}

struct Connectivity: ConnectivityHandler {
    var isConnectedToInternet: Bool {
        if let reachability = try? Reachability(),
            reachability.connection == .unavailable {
            return false
        }
        return true
    }
}
