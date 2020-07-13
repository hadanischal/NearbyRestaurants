//
//  HospitalsNetworking.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation
import RxSwift

protocol RestaurantNetworkHandling: AnyObject {
    func getCollectionsResult(_ location: LocationModel?) -> Observable<[CollectionElement]>
    func getRestaurantResult(_ location: LocationModel?) -> Observable<[RestaurantElement]>
}

extension RestaurantNetworkHandling {
    func getCollectionsResult(_ location: LocationModel? = nil) -> Observable<[CollectionElement]> {
        return getCollectionsResult(location)
    }

    func getRestaurantResult(_ location: LocationModel? = nil) -> Observable<[RestaurantElement]> {
        return getRestaurantResult(location)
    }
}

final class RestaurantNetworkHandler: RestaurantNetworkHandling {
    private let webService: WebServiceProtocol

    init(withWebService webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }

    func getRestaurantResult(_ location: LocationModel?) -> Observable<[RestaurantElement]> {
        guard let url = URL.searchUrl else { return Observable<[RestaurantElement]>.error(NetworkError.badURL) }

        var parameter = [ApiKey.count: "10",
                         ApiKey.lat: "\(location?.latitude ?? -37.8186391)",
                         ApiKey.lon: "\(location?.longitude ?? 145.0014756)"]

        if location == nil,
            let location = LocationManagerHelper.sharedInstance.lastLocation {
            parameter[ApiKey.lat] = "\(location.coordinate.latitude)"
            parameter[ApiKey.lon] = "\(location.coordinate.longitude)"
        }

        var res: Resource<RestaurantResult> { Resource(url: url, parameter: parameter) }

        return webService.load(resource: res)
            .map(\.restaurants)
            .retry(2)
    }

    func getCollectionsResult(_ location: LocationModel?) -> Observable<[CollectionElement]> {
        guard let url = URL.collectionsUrl else { return Observable<[CollectionElement]>.error(NetworkError.badURL) }

        var parameter = [ApiKey.count: "10",
                         ApiKey.lat: "\(location?.latitude ?? -37.8186391)",
                         ApiKey.lon: "\(location?.longitude ?? 145.0014756)",
                         ApiKey.sort: "rating",
                         ApiKey.radius: "1000"]

        var res: Resource<CollectionsResult> { Resource(url: url, parameter: parameter) }

        return webService.load(resource: res)
            .map(\.collections)
            .retry(2)
    }
}
