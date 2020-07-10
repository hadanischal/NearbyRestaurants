//
//  WebService.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import RxSwift

final class WebService: WebServiceProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        return URLRequest.load(resource: resource)
    }
}
