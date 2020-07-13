//
//  RestaurantListViewController.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import CoreLocation
import Kingfisher
import RxCocoa
import RxSwift
import UIKit

final class RestaurantListViewController: UITableViewController, BaseViewProtocol {
    private let rowHeight: CGFloat = 150
    private let headerHeight: CGFloat = 38

    @IBOutlet var searchBar: UISearchBar!
    private var viewModel: RestaurantListDataSource = RestaurantListViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationService()
        setUpUI()
        configureTableView()
        setupViewModel()
    }

    private func setUpUI() {
        viewModel.navigationTitle.bind(to: navigationItem.rx.title).disposed(by: disposeBag)
        navigationItem.backBarButtonItem = navigationController?.backBarButtton
        navigationController?.setCustomStyle()
        // Change UISearchBar font
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.heading2
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.heading2
        tableView.keyboardDismissMode = .onDrag
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTapped))
    }

    private func configureTableView() {
        tableView?.backgroundColor = UIColor.viewBackgroundColor
        view.backgroundColor = UIColor.viewBackgroundColor
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(RestaurantTableViewCell.self)
        tableView.register(CustomHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderFooterView")
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableView.automaticDimension
    }

    @objc func refreshTapped() {
        viewModel.viewDidLoad()
    }

    private func setupViewModel() {
        viewModel.updateInfo
            .filter { $0 }
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { [weak self] _ in
                self?.removeSpinnerView()
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)

        viewModel.errorResult
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] error in
                self?.removeSpinnerView()
                self?.showAlertView(withTitle: error.localizedDescription, andMessage: error.localizedDescription)
            }).disposed(by: disposeBag)

        viewModel.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] status in
                if status {
                    self?.createSpinnerView()
                } else {
                    self?.removeSpinnerView()
                }
            }).disposed(by: disposeBag)

        viewModel.viewDidLoad()

        let searchQuery = searchBar.rx.text.orEmpty.asObservable()
        viewModel.searchRestaurant(withAddress: searchQuery)

        self.searchBar.rx.searchButtonClicked
            .subscribe(onNext: { _ in
                self.view.endEditing(true)
            }).disposed(by: disposeBag)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRestaurant
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RestaurantTableViewCell
        let data = viewModel.restaurantInfo(forIndex: indexPath.row)
        cell.configure(data)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: CustomHeaderFooterView.self))
        view?.textLabel?.text = viewModel.tableViewHeader
        view?.textLabel?.font = .detailTitle
        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handellNavigation(indexPath)
    }

    private func handellNavigation(_ indexPath: IndexPath) {}
}

// MARK: LocationServiceDelegate

extension RestaurantListViewController: LocationManagerDelegate {
    func setupLocationService() {
        LocationManagerHelper.sharedInstance.delegate = self
        LocationManagerHelper.sharedInstance.startUpdatingLocation()
    }

    func locationDidUpdate(_ currentLocation: CLLocation) {
        viewModel.viewDidLoad()
    }

    func locationDidFail(_ error: Error) {
        print("tracing Location Error : \(error)")
    }
}
