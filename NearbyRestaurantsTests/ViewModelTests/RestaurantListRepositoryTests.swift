//
//  RestaurantListRepositoryTests.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
@testable import NearbyRestaurants
import Nimble
import Quick
import RxSwift
import RxTest
import XCTest

final class RestaurantListRepositoryTests: QuickSpec {
    override func spec() {
        var testRepository: RestaurantListRepository!
        var mockRestaurantNetworkHandler: MockRestaurantNetworkHandling!
        var mockLocationService: MockLocationServiceHandling!
        var mockConnectivity: MockConnectivityHandler!
        var testScheduler: TestScheduler!

        describe("RestaurantListRepository Test") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)

                mockRestaurantNetworkHandler = MockRestaurantNetworkHandling()
                stub(mockRestaurantNetworkHandler) { stub in
                    when(stub.getCollectionsResult(any())).thenReturn(Observable<[CollectionElement]>.error(mockError))
                    when(stub.getRestaurantResult(any())).thenReturn(Observable<[RestaurantElement]>.error(mockError))
                }

                mockLocationService = MockLocationServiceHandling()
                stub(mockLocationService) { stub in
                    when(stub.geocode(address: any())).thenReturn(Observable.error(mockError))
                }

                mockConnectivity = MockConnectivityHandler()
                stub(mockConnectivity) { stub in
                    when(stub.isConnectedToInternet).get.thenReturn(true)
                }

                testRepository = RestaurantListRepository(withNetworkHandling: mockRestaurantNetworkHandler,
                                                          locationService: mockLocationService,
                                                          connectivityHandler: mockConnectivity)
            }

            describe("test getRestaurantListFromCollectionsResult") {
                var mockCollectionsResult: [CollectionElement]!

                context("When server request get succeed") {
                    beforeEach {
                        mockCollectionsResult = MockData().stubCollectionsResult()?.collections
                        stub(mockRestaurantNetworkHandler) { stub in
                            when(stub.getCollectionsResult(any())).thenReturn(Observable.just(mockCollectionsResult))
                        }
                    }

                    it("emits the [RestaurantListModel]") {
                        let restaurantList = MockData().restaurantListFromCollectionsResult()
                        let observable = testRepository.getRestaurantListFromCollectionsResult().asObservable()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(2))
                        let correctResult: [Recorded<Event<[RestaurantListModel]>>] = [Recorded.next(200, restaurantList), Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed with error") {
                    beforeEach {
                        stub(mockRestaurantNetworkHandler) { stub in
                            when(stub.getCollectionsResult(any())).thenReturn(Observable<[CollectionElement]>.error(mockError))
                        }
                    }

                    it("emits the error 'MockError.unknown' ") {
                        let observable = testRepository.getRestaurantListFromCollectionsResult().asObservable()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[RestaurantListModel]>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }

            describe("test getRestaurantListFromRestaurantResult") {
                var mockRestaurantResult: [RestaurantElement]!

                context("When server request get succeed") {
                    beforeEach {
                        mockRestaurantResult = MockData().stubRestaurantResult()?.restaurants
                        stub(mockRestaurantNetworkHandler) { stub in
                            when(stub.getRestaurantResult(any())).thenReturn(Observable.just(mockRestaurantResult))
                        }
                    }

                    it("emits the [RestaurantListModel]") {
                        let restaurantList = MockData().restaurantListFromRestaurantResult()

                        let observable = testRepository.getRestaurantListFromRestaurantResult().asObservable()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(2))
                        let correctResult: [Recorded<Event<[RestaurantListModel]>>] = [Recorded.next(200, restaurantList), Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed with error") {
                    beforeEach {
                        stub(mockRestaurantNetworkHandler) { stub in
                            when(stub.getRestaurantResult(any())).thenReturn(Observable<[RestaurantElement]>.error(mockError))
                        }
                    }

                    it("emits the error 'MockError.unknown'") {
                        let observable = testRepository.getRestaurantListFromRestaurantResult().asObservable()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[RestaurantListModel]>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }

            describe("test getRestaurantList with address") {
                var mockRestaurantResult: [RestaurantElement]!
                let mockLocationModel: LocationModel = LocationModel(latitude: 12, longitude: 13)

                context("When mockLocationService request get succeed") {
                    beforeEach {
                        stub(mockLocationService) { stub in
                            when(stub.geocode(address: any())).thenReturn(Observable.just(mockLocationModel))
                        }

                        mockRestaurantResult = MockData().stubRestaurantResult()?.restaurants
                        stub(mockRestaurantNetworkHandler) { stub in
                            when(stub.getRestaurantResult(any())).thenReturn(Observable.just(mockRestaurantResult))
                        }
                    }

                    it("emits the [RestaurantListModel]") {
                        let restaurantList = MockData().restaurantListFromRestaurantResult()

                        let observable = testRepository.getRestaurantList(with: "mock address")
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(2))
                        let correctResult: [Recorded<Event<[RestaurantListModel]>>] = [Recorded.next(200, restaurantList), Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when mockLocationService request failed with error") {
                    beforeEach {
                        stub(mockLocationService) { stub in
                            when(stub.geocode(address: any())).thenReturn(Observable.error(mockError))
                        }
                        stub(mockRestaurantNetworkHandler) { stub in
                            when(stub.getRestaurantResult(any())).thenReturn(Observable.just(MockData().stubRestaurantResult()!.restaurants))
                        }
                    }

                    it("emits the error 'MockError.unknown' ") {
                        let observable = testRepository.getRestaurantList(with: "mock address")
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[RestaurantListModel]>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when isConnectedToInternet is false") {
                    beforeEach {
                        stub(mockConnectivity) { stub in
                            when(stub.isConnectedToInternet).get.thenReturn(false)
                        }
                    }

                    it("emits the error 'NetworkError.noInternetConnectivity' ") {
                        let observable = testRepository.getRestaurantList(with: "mock address")
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[RestaurantListModel]>>] = [Recorded.error(200, NetworkError.noInternetConnectivity)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }
        }
    }
}
