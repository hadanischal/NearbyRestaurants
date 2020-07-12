//
//  RestaurantListViewModel.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation
import RxSwift

protocol RestaurantListDataSource: AnyObject {
    var navigationTitle: Observable<String> { get }
    var numberOfRestaurant: Int { get }
    var tableViewHeader: String { get }
    var updateInfo: Observable<Bool> { get }
    var errorResult: Observable<Error> { get }
    var isLoading: Observable<Bool> { get }
    func viewDidLoad()
    func restaurantInfo(forIndex index: Int) -> RestaurantListModel
    func searchRestaurant(withAddress address: Observable<String>)
}

final class RestaurantListViewModel: RestaurantListDataSource {
    var navigationTitle: Observable<String> { Observable.just(L10n.DashBoard.navigationTitle) }
    var tableViewHeader: String { L10n.DashBoard.tableViewTitle }

    var numberOfRestaurant: Int { self.restaurantList.count }
    let updateInfo: Observable<Bool>
    let errorResult: Observable<Error>
    let isLoading: Observable<Bool>

    private let disposeBag = DisposeBag()
    private var restaurantList = [RestaurantListModel]()
    private let repository: RestaurantListRepositoryHandling

    private let updateInfoSubject = PublishSubject<Bool>()
    private let errorResultSubject = PublishSubject<Error>()
    private let loadingSubject = BehaviorSubject<Bool>(value: true)

    init(withRepositoryHandling repository: RestaurantListRepositoryHandling = RestaurantListRepository()) {
        self.repository = repository
        self.updateInfo = updateInfoSubject.asObservable()
        self.errorResult = errorResultSubject.asObservable()
        self.isLoading = loadingSubject.asObservable()
    }

    func viewDidLoad() {
        repository.getRestaurantListFromRestaurantResult()
            .subscribe(onNext: { [weak self] result in
                self?.restaurantList = result
                self?.updateInfoSubject.onNext(true)
                self?.loadingSubject.onNext(false)

                }, onError: { [weak self] error in
                    self?.errorResultSubject.on(.next(error))
                    self?.loadingSubject.onNext(false)

            })
            .disposed(by: disposeBag)
    }

    func restaurantInfo(forIndex index: Int) -> RestaurantListModel {
        self.restaurantList[index]
    }

    func searchRestaurant(withAddress address: Observable<String>) {
        self.loadingSubject.onNext(true)

        address
            .throttle(.milliseconds(600), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMap({ searchQuery -> Observable<[RestaurantListModel]> in
                guard !searchQuery.isEmpty else { return Observable.empty() }
                return self.repository
                    .getRestaurantList(with: searchQuery)
                    .catchError { self.handleErrors($0) }
            })
            .subscribe(onNext: { [weak self] result in

                self?.restaurantList = result
                self?.updateInfoSubject.onNext(true)
                self?.loadingSubject.onNext(false)

                })
            .disposed(by: disposeBag)
    }

    private func handleErrors(_ error: Error) -> Observable<[RestaurantListModel]> {
        if let error = error as? NetworkError, error == NetworkError.noInternetConnectivity {
            self.errorResultSubject.on(.next(error))
        }
        self.loadingSubject.onNext(false)
        return Observable.empty()
    }
}
