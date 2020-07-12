//
//  RestaurantListRepository.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation
import RxSwift

protocol RestaurantListRepositoryHandling: AnyObject {
    func getRestaurantListFromCollectionsResult() -> Observable<[RestaurantListModel]>
    func getRestaurantListFromRestaurantResult() -> Observable<[RestaurantListModel]>
    func getRestaurantList(with address: String) -> Observable<[RestaurantListModel]>
}

final class RestaurantListRepository: RestaurantListRepositoryHandling {
    private let networkHandler: RestaurantNetworkHandling
    private let locationService: LocationServiceHandling
    private let connectivity: ConnectivityHandler

    init(withNetworkHandling networkHandler: RestaurantNetworkHandling = RestaurantNetworkHandler(),
         locationService: LocationServiceHandling = LocationServiceHandler(),
         connectivityHandler: ConnectivityHandler = Connectivity()) {
        self.networkHandler = networkHandler
        self.locationService = locationService
        self.connectivity = connectivityHandler
    }

    func getRestaurantListFromCollectionsResult() -> Observable<[RestaurantListModel]> {
        networkHandler
            .getCollectionsResult()
            .compactMap { list -> [RestaurantListModel] in
                list.map { RestaurantListModel($0.restaurant) }
            }
    }

    func getRestaurantListFromRestaurantResult() -> Observable<[RestaurantListModel]> {
        getRestaurantResult()
    }

    func getRestaurantList(with address: String) -> Observable<[RestaurantListModel]> {
        Observable.just(connectivity.isConnectedToInternet)
            .flatMap { status -> Observable<Void> in
                guard status else { return Observable<Void>.error(NetworkError.noInternetConnectivity) }
                return Observable.just(())
            }
            .flatMap { self.locationService.geocode(address: address) }
            .flatMap { self.getRestaurantResult($0) }
    }

    private func getRestaurantResult(_ location: LocationModel? = nil) -> Observable<[RestaurantListModel]> {
        networkHandler
            .getRestaurantResult(location)
            .compactMap { list -> [RestaurantListModel] in
                list.map { RestaurantListModel($0.restaurant) }
            }
    }

//    private func getCollectionsResult(_ location: LocationModel?) -> Observable<[CollectionElement]> {
//        self.networkHandler
//            .getCollectionsResult(location)
//            .compactMap { list -> [RestaurantListModel] in
//                list.map { RestaurantListModel($0.restaurant) }
//        }
//    }
}
