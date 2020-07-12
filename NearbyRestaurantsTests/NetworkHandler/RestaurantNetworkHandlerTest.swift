//
//  RestaurantNetworkHandlerTest.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
import Nimble
import Quick
import RxSwift
import RxTest
import XCTest

@testable import NearbyRestaurants

final class RestaurantNetworkHandlerTest: QuickSpec {
    override func spec() {
        var testNetworkHandler: RestaurantNetworkHandler!
        var mockWebService: MockWebServiceProtocol!
        var testScheduler: TestScheduler!

        describe("RestaurantNetworkHandler Test") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockWebService = MockWebServiceProtocol()
                stub(mockWebService) { stub in
                    when(stub.load(resource: any())).thenReturn(Observable<RestaurantResult>.error(mockError))
                }
                testNetworkHandler = RestaurantNetworkHandler(withWebService: mockWebService)
            }

            describe("test CollectionsResult") {
                var mockCollectionsResult: CollectionsResult!
                context("When server request get succeed") {
                    beforeEach {
                        mockCollectionsResult = MockData().stubCollectionsResult()
                        stub(mockWebService) { stub in
                            when(stub.load(resource: any(Resource<CollectionsResult>.self))).thenReturn(Observable.just(mockCollectionsResult))
                        }
                    }

                    it("emits the CollectionsResult") {
                        let observable = testNetworkHandler.getCollectionsResult()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(2))
                        let correctResult: [Recorded<Event<[CollectionElement]>>] = [Recorded.next(200, mockCollectionsResult.collections),
                                                                                     Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed with error") {
                    beforeEach {
                        stub(mockWebService) { stub in
                            when(stub.load(resource: any(Resource<CollectionsResult>.self))).thenReturn(Observable.error(mockError))
                        }
                    }

                    it("emits the error") {
                        let observable = testNetworkHandler.getCollectionsResult()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[CollectionElement]>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }

            describe("test RestaurantResult") {
                var mockRestaurantResult: RestaurantResult!

                context("When server request get succeed") {
                    beforeEach {
                        mockRestaurantResult = MockData().stubRestaurantResult()
                        stub(mockWebService) { stub in
                            when(stub.load(resource: any(Resource<RestaurantResult>.self))).thenReturn(Observable.just(mockRestaurantResult))
                        }
                    }

                    it("emits the RestaurantResult") {
                        let observable = testNetworkHandler.getRestaurantResult()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(2))
                        let correctResult: [Recorded<Event<[RestaurantElement]>>] = [Recorded.next(200, mockRestaurantResult.restaurants), Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed with error") {
                    beforeEach {
                        stub(mockWebService) { stub in
                            when(stub.load(resource: any(Resource<RestaurantResult>.self))).thenReturn(Observable.error(mockError))
                        }
                    }

                    it("emits the error") {
                        let observable = testNetworkHandler.getRestaurantResult()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[RestaurantElement]>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }
        }
    }
}
