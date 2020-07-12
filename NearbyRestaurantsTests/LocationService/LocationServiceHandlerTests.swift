//
//  LocationServiceHandlerTests.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 12/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
import Nimble
import Quick
import RxSwift
import RxTest
import XCTest

@testable import NearbyRestaurants

final class LocationServiceHandlerTests: QuickSpec {
    override func spec() {
        var testLocationService: LocationServiceHandler!
        var mockGeocoder: MockCLGeocoder!
        var testScheduler: TestScheduler!
        let mockCLPlacemark = MockCLPlacemark.customPlacemark

        describe("LocationServiceHandler Test") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockGeocoder = MockCLGeocoder()
                stub(mockGeocoder) { stub in
                    when(stub.geocodeAddressString(any(), completionHandler: anyClosure())).thenDoNothing()
                }
                testLocationService = LocationServiceHandler(mockGeocoder)
            }

            describe("geocode Address String request succeed ") {
                beforeEach {
                    stub(mockGeocoder) { stub in
                        when(stub.geocodeAddressString(any(), completionHandler: any())).then { result in
                            let (_, geocodeCompletionHandler) = result
                            geocodeCompletionHandler([mockCLPlacemark], nil)
                        }
                    }
                }
                it("emit the LocationModel") {
                    let result = LocationModel(latitude: (mockCLPlacemark.location?.coordinate.latitude)!, longitude: (mockCLPlacemark.location?.coordinate.longitude)!)
                    let observable = testLocationService.geocode(address: "mock address").asObservable()
                    let res = testScheduler.start { observable }

                    expect(res.events.count).to(equal(2))
                    let correctResult: [Recorded<Event<LocationModel?>>] = [Recorded.next(200, result),
                                                                            Recorded.completed(200)]
                    expect(res.events).to(equal(correctResult))
                }
            }

            describe("When CLGeocoder is unable geocodeAddressString ") {
                context("When return error") {
                    beforeEach {
                        stub(mockGeocoder) { stub in
                            when(stub.geocodeAddressString(any(), completionHandler: any())).then { result in
                                let (_, geocodeCompletionHandler) = result
                                geocodeCompletionHandler([mockCLPlacemark], mockError)
                            }
                        }
                    }

                    it("emits the error") {
                        let observable = testLocationService.geocode(address: "mock address").asObservable()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<LocationModel?>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("When return null location") {
                    beforeEach {
                        stub(mockGeocoder) { stub in
                            when(stub.geocodeAddressString(any(), completionHandler: any())).then { result in
                                let (_, geocodeCompletionHandler) = result
                                geocodeCompletionHandler(nil, nil)
                            }
                        }
                    }

                    it("emits the error") {
                        let observable = testLocationService.geocode(address: "mock address").asObservable()
                        let res = testScheduler.start { observable }

                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<LocationModel?>>] = [Recorded.error(200, NetworkError.locationNotFound)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }
        }
    }
}
