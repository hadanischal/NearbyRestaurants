//
//  URLRequest+Extensions.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct Resource<T: Decodable> {
    var url: URL
    var parameter: [String: String]?
}

extension URLRequest {
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        return Observable.just(resource.url)
            .flatMap { url -> Observable<(response: HTTPURLResponse, data: Data)> in
                var request = URLRequest(url: self.loadURL(resource: resource) ?? url)
                request.setValue(Environment.Variables.zomatoApiKey, forHTTPHeaderField: "user-key")
                return URLSession.shared.rx.response(request: request)
        }.map { response, data -> T in

            if 200 ..< 300 ~= response.statusCode {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(T.self, from: data)
                return result
            } else {
                throw RxCocoaURLError.httpRequestFailed(response: response, data: data)
            }

        }.asObservable()
    }

    static func loadURL<T>(resource: Resource<T>) -> URL? {
        if
            let parameters = resource.parameter,
            let urlComponents = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
        {
            var components = urlComponents
            components.queryItems = parameters.map { (arg) -> URLQueryItem in
                let (key, value) = arg
                return URLQueryItem(name: key, value: value)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            return components.url
        }
        return nil
    }
}
