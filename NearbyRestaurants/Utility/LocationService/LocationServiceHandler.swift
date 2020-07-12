//
//  LocationServiceHandler.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import CoreLocation
import Foundation
import RxSwift

protocol LocationServiceHandling {
    func geocode(address: String) -> Observable<LocationModel?>
}

struct LocationServiceHandler: LocationServiceHandling {
    private let geocoder: CLGeocoder

    init(_ geoCoder: CLGeocoder = CLGeocoder()) {
        self.geocoder = geoCoder
    }

    /// Geocoding handler
    /// - Parameter address: addressString to geocode
    /// - Returns: [LocationModel] with 'latitude', 'longitude'.
    func geocode(address: String) -> Observable<LocationModel?> {
        return Observable.create { observer in

            self.geocoder.geocodeAddressString(address) { placemarks, error in
                print("error: \(String(describing: error))")

                if let error = error {
                    observer.onError(error)
                }

                guard let placemarks = placemarks,
                    let location = placemarks.first?.location else {
                        observer.onError(NetworkError.locationNotFound)
                        return
                }

                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
                print("latitude: \(lat), longitude: \(lon)")

                // Use your location
                let model = LocationModel(latitude: lat, longitude: lon)
                observer.onNext(model)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
