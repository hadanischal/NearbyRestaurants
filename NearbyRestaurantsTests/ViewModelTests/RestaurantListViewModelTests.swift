//
//  RestaurantListViewModelTests.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//
// swiftlint:disable force_cast

import Cuckoo
@testable import NearbyRestaurants
import Nimble
import Quick
import RxSwift
import RxTest
import XCTest

final class RestaurantListViewModelTests: QuickSpec {
    override func spec() {
        var testViewModel: RestaurantListViewModel!
        var mockRepository: MockRestaurantListRepositoryHandling!
        var testScheduler: TestScheduler!

        let restaurantList = MockData().restaurantListFromCollectionsResult()

        describe("RestaurantListViewModel test") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)

                mockRepository = MockRestaurantListRepositoryHandling()
                stub(mockRepository) { stub in
                    when(stub.getRestaurantListFromCollectionsResult()).thenReturn(Observable<[RestaurantListModel]>.error(mockError))
                    when(stub.getRestaurantListFromRestaurantResult()).thenReturn(Observable<[RestaurantListModel]>.error(mockError))
                }

                testViewModel = RestaurantListViewModel(withRepositoryHandling: mockRepository)
            }

            it("sets the titleText correctly") {
                let res = testScheduler.start { testViewModel.navigationTitle.asObservable() }
                expect(res.events.count).to(equal(2))
                let correctResult = [Recorded.next(200, "Restaurant List"),
                                     Recorded.completed(200)]
                expect(res.events).to(equal(correctResult))
            }

            it("sets the tableViewHeader correctly") {
                expect(testViewModel.tableViewHeader).to(equal("Select Restaurant"))
            }

            describe("Get restaurantList") {
                context("When server request get succeed") {
                    beforeEach {
                        stub(mockRepository) { stub in
                            when(stub.getRestaurantListFromRestaurantResult()).thenReturn(Observable.just(restaurantList))
                        }
                        testViewModel.viewDidLoad()

                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                    }
                    it("it completed successfully") {
                        verify(mockRepository).getRestaurantListFromRestaurantResult()
                    }
                    it("it sets numberOfRestaurant correctly") {
                        expect(testViewModel.numberOfRestaurant).to(equal(2))
                    }

                    it("emits the restaurantList to the UI") {
                        let res = testScheduler.start { testViewModel.updateInfo }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.next(300, true)]
                        expect(res.events).to(equal(correctResult))
                    }

                    it("wont emits the errorResult to the UI") {
                        let res = testScheduler.start { testViewModel.errorResult }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }

                    it("emits the isLoading to the UI") {
                        let res = testScheduler.start { testViewModel.isLoading }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, false), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed with error") {
                    beforeEach {
                        stub(mockRepository) { stub in
                            when(stub.getRestaurantListFromRestaurantResult()).thenReturn(Observable.error(mockError))
                        }
                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                        testViewModel.viewDidLoad()
                    }
                    it("it completed successfully") {
                        verify(mockRepository).getRestaurantListFromRestaurantResult()
                    }
                    it("it sets numberOfRestaurant correctly") {
                        expect(testViewModel.numberOfRestaurant).to(equal(0))
                    }
                    it("doesnt emits restaurantList to the UI") {
                        let res = testScheduler.start { testViewModel.updateInfo }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }
                    it("wont emits the errorResult to the UI") {
                        let res = testScheduler.start { testViewModel.errorResult.map { $0 as! MockError } }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(1))

                        let correctResult = [Recorded.next(300, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }

                    it("emits the isLoading to the UI") {
                        let res = testScheduler.start { testViewModel.isLoading }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, false), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }

            describe("search restaurantList with address ") {
                var searchText: Observable<String>!

                context("When server request get succeed") {
                    beforeEach {
                        searchText = testScheduler.createColdObservable([Recorded.next(300, "Richmond Victoria")]).asObservable()

                        stub(mockRepository) { stub in
                            when(stub.getRestaurantList(with: any())).thenReturn(Observable.just(restaurantList))
                        }

                        testViewModel.searchRestaurant(withAddress: searchText)
                    }

                    it("emits the restaurantList to the UI") {
                        let res = testScheduler.start { testViewModel.updateInfo }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.next(300, true)]
                        expect(res.events).to(equal(correctResult))
                    }

                    it("wont emits the errorResult to the UI") {
                        let res = testScheduler.start { testViewModel.errorResult }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }

                    it("emits the isLoading to the UI") {
                        let res = testScheduler.start { testViewModel.isLoading }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, true), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed with error noInternetConnectivity") {
                    beforeEach {
                        searchText = testScheduler.createColdObservable([Recorded.next(300, "Richmond Victoria")]).asObservable()

                        stub(mockRepository) { stub in
                            when(stub.getRestaurantList(with: any())).thenReturn(Observable.error(NetworkError.noInternetConnectivity))
                        }
                        testViewModel.searchRestaurant(withAddress: searchText)
                    }

                    it("it sets numberOfRestaurant correctly") {
                        expect(testViewModel.numberOfRestaurant).to(equal(0))
                    }
                    it("doesnt emits restaurantList to the UI") {
                        let res = testScheduler.start { testViewModel.updateInfo }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }
                    it("wont emits the errorResult to the UI") {
                        let res = testScheduler.start { testViewModel.errorResult.map { $0 as! NetworkError } }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(1))

                        let correctResult = [Recorded.next(300, NetworkError.noInternetConnectivity)]
                        expect(res.events).to(equal(correctResult))
                    }

                    it("emits the isLoading to the UI") {
                        let res = testScheduler.start { testViewModel.isLoading }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, true), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed with general error") {
                    beforeEach {
                        searchText = testScheduler.createColdObservable([Recorded.next(300, "Richmond Victoria")]).asObservable()

                        stub(mockRepository) { stub in
                            when(stub.getRestaurantList(with: any())).thenReturn(Observable.error(mockError))
                        }
                        testViewModel.searchRestaurant(withAddress: searchText)
                    }

                    it("it sets numberOfRestaurant correctly") {
                        expect(testViewModel.numberOfRestaurant).to(equal(0))
                    }
                    it("doesnt emits restaurantList to the UI") {
                        let res = testScheduler.start { testViewModel.updateInfo }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }
                    it("wont emits the errorResult to the UI") {
                        let res = testScheduler.start { testViewModel.errorResult }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }

                    it("emits the isLoading to the UI") {
                        let res = testScheduler.start { testViewModel.isLoading }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, true), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }

            context("Get restaurantInfo for index") {
                beforeEach {
                    stub(mockRepository) { stub in
                        when(stub.getRestaurantListFromRestaurantResult()).thenReturn(Observable.just(restaurantList))
                    }
                    testViewModel.viewDidLoad()
                }

                it("it sets numberOfRestaurant correctly") {
                    expect(testViewModel.numberOfRestaurant).to(equal(2))
                }

                it("it sets DiseaseModel correctly") {
                    for item in restaurantList.enumerated() {
                        let (index, mockDiseaseModel) = item
                        expect(testViewModel.restaurantInfo(forIndex: index)).to(equal(mockDiseaseModel))
                    }
                }
            }
        }
    }
}
