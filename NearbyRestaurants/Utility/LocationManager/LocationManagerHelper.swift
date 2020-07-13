//
//  LocationManagerHelper.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 13/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import CoreLocation
import Foundation

protocol LocationManagerDelegate: AnyObject {
    func locationDidUpdate(_ currentLocation: CLLocation)
    func locationDidFail(_ error: Error)
}

final class LocationManagerHelper: NSObject, CLLocationManagerDelegate {
    static let sharedInstance = LocationManagerHelper()
    weak var delegate: LocationManagerDelegate?
    var locationManager: CLLocationManager?
    var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager = CLLocationManager()
        guard let locationManager = locationManager else { return }
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .denied:
            print("LocationManager Location denied")
        case .authorizedAlways:
            print("LocationManager Location authorizedAlways")
        default:
            break
        }
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func startUpdatingLocation() {
        print("Starting Location Updates")
        locationManager?.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        print("Stop Location Updates")
        locationManager?.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        if lastLocation == nil {
            lastLocation = location // use for real time update location
            updateLocation(location)
        }
        locationManager?.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        updateLocationDidFailWithError(error)
    }

    private func updateLocation(_ currentLocation: CLLocation) {
        guard let delegate = delegate else { return }
        delegate.locationDidUpdate(currentLocation)
    }

    private func updateLocationDidFailWithError(_ error: Error) {
        guard let delegate = delegate else { return }
        delegate.locationDidFail(error)
    }
}
