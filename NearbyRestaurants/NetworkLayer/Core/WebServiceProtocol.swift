//
//  WebServiceProtocol.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import RxSwift

protocol WebServiceProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T>
}
