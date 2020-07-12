// MARK: - Mocks generated from file: NearbyRestaurants/NetworkLayer/Core/WebServiceProtocol.swift at 2020-07-12 22:45:57 +0000

//
//  WebServiceProtocol.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
@testable import NearbyRestaurants

import RxSwift


 class MockWebServiceProtocol: WebServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = WebServiceProtocol
    
     typealias Stubbing = __StubbingProxy_WebServiceProtocol
     typealias Verification = __VerificationProxy_WebServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: WebServiceProtocol?

     func enableDefaultImplementation(_ stub: WebServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        
    return cuckoo_manager.call("load(resource: Resource<T>) -> Observable<T>",
            parameters: (resource),
            escapingParameters: (resource),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.load(resource: resource))
        
    }
    

	 struct __StubbingProxy_WebServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func load<M1: Cuckoo.Matchable, T: Decodable>(resource: M1) -> Cuckoo.ProtocolStubFunction<(Resource<T>), Observable<T>> where M1.MatchedType == Resource<T> {
	        let matchers: [Cuckoo.ParameterMatcher<(Resource<T>)>] = [wrap(matchable: resource) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWebServiceProtocol.self, method: "load(resource: Resource<T>) -> Observable<T>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_WebServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func load<M1: Cuckoo.Matchable, T: Decodable>(resource: M1) -> Cuckoo.__DoNotUse<(Resource<T>), Observable<T>> where M1.MatchedType == Resource<T> {
	        let matchers: [Cuckoo.ParameterMatcher<(Resource<T>)>] = [wrap(matchable: resource) { $0 }]
	        return cuckoo_manager.verify("load(resource: Resource<T>) -> Observable<T>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class WebServiceProtocolStub: WebServiceProtocol {
    

    

    
     func load<T: Decodable>(resource: Resource<T>) -> Observable<T>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }
    
}


// MARK: - Mocks generated from file: NearbyRestaurants/NetworkLayer/Services/RestaurantNetworkHandler.swift at 2020-07-12 22:45:57 +0000

//
//  HospitalsNetworking.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
@testable import NearbyRestaurants

import Foundation
import RxSwift


 class MockRestaurantNetworkHandling: RestaurantNetworkHandling, Cuckoo.ProtocolMock {
    
     typealias MocksType = RestaurantNetworkHandling
    
     typealias Stubbing = __StubbingProxy_RestaurantNetworkHandling
     typealias Verification = __VerificationProxy_RestaurantNetworkHandling

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RestaurantNetworkHandling?

     func enableDefaultImplementation(_ stub: RestaurantNetworkHandling) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getCollectionsResult(_ location: LocationModel?) -> Observable<[CollectionElement]> {
        
    return cuckoo_manager.call("getCollectionsResult(_: LocationModel?) -> Observable<[CollectionElement]>",
            parameters: (location),
            escapingParameters: (location),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCollectionsResult(location))
        
    }
    
    
    
     func getRestaurantResult(_ location: LocationModel?) -> Observable<[RestaurantElement]> {
        
    return cuckoo_manager.call("getRestaurantResult(_: LocationModel?) -> Observable<[RestaurantElement]>",
            parameters: (location),
            escapingParameters: (location),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getRestaurantResult(location))
        
    }
    

	 struct __StubbingProxy_RestaurantNetworkHandling: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getCollectionsResult<M1: Cuckoo.OptionalMatchable>(_ location: M1) -> Cuckoo.ProtocolStubFunction<(LocationModel?), Observable<[CollectionElement]>> where M1.OptionalMatchedType == LocationModel {
	        let matchers: [Cuckoo.ParameterMatcher<(LocationModel?)>] = [wrap(matchable: location) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRestaurantNetworkHandling.self, method: "getCollectionsResult(_: LocationModel?) -> Observable<[CollectionElement]>", parameterMatchers: matchers))
	    }
	    
	    func getRestaurantResult<M1: Cuckoo.OptionalMatchable>(_ location: M1) -> Cuckoo.ProtocolStubFunction<(LocationModel?), Observable<[RestaurantElement]>> where M1.OptionalMatchedType == LocationModel {
	        let matchers: [Cuckoo.ParameterMatcher<(LocationModel?)>] = [wrap(matchable: location) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRestaurantNetworkHandling.self, method: "getRestaurantResult(_: LocationModel?) -> Observable<[RestaurantElement]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RestaurantNetworkHandling: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getCollectionsResult<M1: Cuckoo.OptionalMatchable>(_ location: M1) -> Cuckoo.__DoNotUse<(LocationModel?), Observable<[CollectionElement]>> where M1.OptionalMatchedType == LocationModel {
	        let matchers: [Cuckoo.ParameterMatcher<(LocationModel?)>] = [wrap(matchable: location) { $0 }]
	        return cuckoo_manager.verify("getCollectionsResult(_: LocationModel?) -> Observable<[CollectionElement]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getRestaurantResult<M1: Cuckoo.OptionalMatchable>(_ location: M1) -> Cuckoo.__DoNotUse<(LocationModel?), Observable<[RestaurantElement]>> where M1.OptionalMatchedType == LocationModel {
	        let matchers: [Cuckoo.ParameterMatcher<(LocationModel?)>] = [wrap(matchable: location) { $0 }]
	        return cuckoo_manager.verify("getRestaurantResult(_: LocationModel?) -> Observable<[RestaurantElement]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RestaurantNetworkHandlingStub: RestaurantNetworkHandling {
    

    

    
     func getCollectionsResult(_ location: LocationModel?) -> Observable<[CollectionElement]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[CollectionElement]>).self)
    }
    
     func getRestaurantResult(_ location: LocationModel?) -> Observable<[RestaurantElement]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[RestaurantElement]>).self)
    }
    
}


// MARK: - Mocks generated from file: NearbyRestaurants/Utility/Connectivity.swift at 2020-07-12 22:45:57 +0000

//
//  Connectivity.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 12/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
@testable import NearbyRestaurants

import Foundation
import Reachability


 class MockConnectivityHandler: ConnectivityHandler, Cuckoo.ProtocolMock {
    
     typealias MocksType = ConnectivityHandler
    
     typealias Stubbing = __StubbingProxy_ConnectivityHandler
     typealias Verification = __VerificationProxy_ConnectivityHandler

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ConnectivityHandler?

     func enableDefaultImplementation(_ stub: ConnectivityHandler) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var isConnectedToInternet: Bool {
        get {
            return cuckoo_manager.getter("isConnectedToInternet",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isConnectedToInternet)
        }
        
    }
    

    

    

	 struct __StubbingProxy_ConnectivityHandler: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var isConnectedToInternet: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockConnectivityHandler, Bool> {
	        return .init(manager: cuckoo_manager, name: "isConnectedToInternet")
	    }
	    
	    
	}

	 struct __VerificationProxy_ConnectivityHandler: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var isConnectedToInternet: Cuckoo.VerifyReadOnlyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isConnectedToInternet", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class ConnectivityHandlerStub: ConnectivityHandler {
    
    
     var isConnectedToInternet: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: NearbyRestaurants/Utility/LocationService/LocationServiceHandler.swift at 2020-07-12 22:45:57 +0000

//
//  LocationServiceHandler.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
@testable import NearbyRestaurants

import CoreLocation
import Foundation
import RxSwift


 class MockLocationServiceHandling: LocationServiceHandling, Cuckoo.ProtocolMock {
    
     typealias MocksType = LocationServiceHandling
    
     typealias Stubbing = __StubbingProxy_LocationServiceHandling
     typealias Verification = __VerificationProxy_LocationServiceHandling

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LocationServiceHandling?

     func enableDefaultImplementation(_ stub: LocationServiceHandling) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func geocode(address: String) -> Observable<LocationModel?> {
        
    return cuckoo_manager.call("geocode(address: String) -> Observable<LocationModel?>",
            parameters: (address),
            escapingParameters: (address),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.geocode(address: address))
        
    }
    

	 struct __StubbingProxy_LocationServiceHandling: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func geocode<M1: Cuckoo.Matchable>(address: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<LocationModel?>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: address) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationServiceHandling.self, method: "geocode(address: String) -> Observable<LocationModel?>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_LocationServiceHandling: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func geocode<M1: Cuckoo.Matchable>(address: M1) -> Cuckoo.__DoNotUse<(String), Observable<LocationModel?>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: address) { $0 }]
	        return cuckoo_manager.verify("geocode(address: String) -> Observable<LocationModel?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class LocationServiceHandlingStub: LocationServiceHandling {
    

    

    
     func geocode(address: String) -> Observable<LocationModel?>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<LocationModel?>).self)
    }
    
}


// MARK: - Mocks generated from file: NearbyRestaurants/ViewModel/RestaurantList/RestaurantListRepository.swift at 2020-07-12 22:45:57 +0000

//
//  RestaurantListRepository.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Cuckoo
@testable import NearbyRestaurants

import Foundation
import RxSwift


 class MockRestaurantListRepositoryHandling: RestaurantListRepositoryHandling, Cuckoo.ProtocolMock {
    
     typealias MocksType = RestaurantListRepositoryHandling
    
     typealias Stubbing = __StubbingProxy_RestaurantListRepositoryHandling
     typealias Verification = __VerificationProxy_RestaurantListRepositoryHandling

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RestaurantListRepositoryHandling?

     func enableDefaultImplementation(_ stub: RestaurantListRepositoryHandling) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getRestaurantListFromCollectionsResult() -> Observable<[RestaurantListModel]> {
        
    return cuckoo_manager.call("getRestaurantListFromCollectionsResult() -> Observable<[RestaurantListModel]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getRestaurantListFromCollectionsResult())
        
    }
    
    
    
     func getRestaurantListFromRestaurantResult() -> Observable<[RestaurantListModel]> {
        
    return cuckoo_manager.call("getRestaurantListFromRestaurantResult() -> Observable<[RestaurantListModel]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getRestaurantListFromRestaurantResult())
        
    }
    
    
    
     func getRestaurantList(with address: String) -> Observable<[RestaurantListModel]> {
        
    return cuckoo_manager.call("getRestaurantList(with: String) -> Observable<[RestaurantListModel]>",
            parameters: (address),
            escapingParameters: (address),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getRestaurantList(with: address))
        
    }
    

	 struct __StubbingProxy_RestaurantListRepositoryHandling: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getRestaurantListFromCollectionsResult() -> Cuckoo.ProtocolStubFunction<(), Observable<[RestaurantListModel]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRestaurantListRepositoryHandling.self, method: "getRestaurantListFromCollectionsResult() -> Observable<[RestaurantListModel]>", parameterMatchers: matchers))
	    }
	    
	    func getRestaurantListFromRestaurantResult() -> Cuckoo.ProtocolStubFunction<(), Observable<[RestaurantListModel]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRestaurantListRepositoryHandling.self, method: "getRestaurantListFromRestaurantResult() -> Observable<[RestaurantListModel]>", parameterMatchers: matchers))
	    }
	    
	    func getRestaurantList<M1: Cuckoo.Matchable>(with address: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<[RestaurantListModel]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: address) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRestaurantListRepositoryHandling.self, method: "getRestaurantList(with: String) -> Observable<[RestaurantListModel]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RestaurantListRepositoryHandling: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getRestaurantListFromCollectionsResult() -> Cuckoo.__DoNotUse<(), Observable<[RestaurantListModel]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getRestaurantListFromCollectionsResult() -> Observable<[RestaurantListModel]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getRestaurantListFromRestaurantResult() -> Cuckoo.__DoNotUse<(), Observable<[RestaurantListModel]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getRestaurantListFromRestaurantResult() -> Observable<[RestaurantListModel]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getRestaurantList<M1: Cuckoo.Matchable>(with address: M1) -> Cuckoo.__DoNotUse<(String), Observable<[RestaurantListModel]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: address) { $0 }]
	        return cuckoo_manager.verify("getRestaurantList(with: String) -> Observable<[RestaurantListModel]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RestaurantListRepositoryHandlingStub: RestaurantListRepositoryHandling {
    

    

    
     func getRestaurantListFromCollectionsResult() -> Observable<[RestaurantListModel]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[RestaurantListModel]>).self)
    }
    
     func getRestaurantListFromRestaurantResult() -> Observable<[RestaurantListModel]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[RestaurantListModel]>).self)
    }
    
     func getRestaurantList(with address: String) -> Observable<[RestaurantListModel]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[RestaurantListModel]>).self)
    }
    
}

