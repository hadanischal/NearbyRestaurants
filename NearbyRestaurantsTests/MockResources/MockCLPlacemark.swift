//
//  MockCLPlacemark.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 12/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Contacts
import Foundation
import MapKit

struct MockCLPlacemark {
    static let mockPlaceLocation = CLLocation(latitude: 50.00, longitude: 8.00)
    static let mockCLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 50.00, longitude: 8.00)
    static let mockPlaceName = "Mock Some name"
    static let customPlacemark = MyPlacemark(coordinate: mockCLLocationCoordinate2D)
}

class MyPlacemark: MKPlacemark {}
