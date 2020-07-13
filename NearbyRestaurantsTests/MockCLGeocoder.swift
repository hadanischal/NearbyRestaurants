//
//  MockCLGeocoder.swift
//  NearbyRestaurantsTests
//
//  Created by Nischal Hada on 12/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//
// swiftlint:disable all

import CoreLocation
import Cuckoo
import Foundation

@testable import NearbyRestaurants
class MockCLGeocoder: CLGeocoder, Cuckoo.ClassMock {
    typealias MocksType = CLGeocoder

    typealias Stubbing = __StubbingProxy_CLGeocoder
    typealias Verification = __VerificationProxy_CLGeocoder

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    private var __defaultImplStub: CLGeocoder?

    func enableDefaultImplementation(_ stub: CLGeocoder) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
        return cuckoo_manager.call("geocodeAddressString(_: String, completionHandler: @escaping CLGeocodeCompletionHandler)",
                                   parameters: (addressString, completionHandler),
                                   escapingParameters: (addressString, completionHandler),
                                   superclassCall:

            super.geocodeAddressString(addressString, completionHandler: completionHandler),
                                   
                                   defaultCall: __defaultImplStub!.geocodeAddressString(addressString, completionHandler: completionHandler))
    }

    override func geocodeAddressString(_ addressString: String, in region: CLRegion?, completionHandler: @escaping CLGeocodeCompletionHandler) {
        return cuckoo_manager.call("geocodeAddressString(_: String, in: CLRegion?, completionHandler: @escaping CLGeocodeCompletionHandler)",
                                   parameters: (addressString, region, completionHandler),
                                   escapingParameters: (addressString, region, completionHandler),
                                   superclassCall:

            super.geocodeAddressString(addressString, in: region, completionHandler: completionHandler),
                                   
                                   defaultCall: __defaultImplStub!.geocodeAddressString(addressString, in: region, completionHandler: completionHandler))
    }

    @available(iOS 11.0, *)

    override func geocodeAddressString(_ addressString: String, in region: CLRegion?, preferredLocale locale: Locale?, completionHandler: @escaping CLGeocodeCompletionHandler) {
        return cuckoo_manager.call("geocodeAddressString(_: String, in: CLRegion?, preferredLocale: Locale?, completionHandler: @escaping CLGeocodeCompletionHandler)",
                                   parameters: (addressString, region, locale, completionHandler),
                                   escapingParameters: (addressString, region, locale, completionHandler),
                                   superclassCall:

            super.geocodeAddressString(addressString, in: region, preferredLocale: locale, completionHandler: completionHandler),
                                   
                                   defaultCall: __defaultImplStub!.geocodeAddressString(addressString, in: region, preferredLocale: locale, completionHandler: completionHandler))
    }

    struct __StubbingProxy_CLGeocoder: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }

        func geocodeAddressString<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ addressString: M1, completionHandler: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, CLGeocodeCompletionHandler)> where M1.MatchedType == String, M2.MatchedType == CLGeocodeCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, CLGeocodeCompletionHandler)>] = [wrap(matchable: addressString) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockCLGeocoder.self, method: "geocodeAddressString(_: String, completionHandler: @escaping CLGeocodeCompletionHandler)", parameterMatchers: matchers))
        }

        func geocodeAddressString<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable>(_ addressString: M1, in region: M2, completionHandler: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, CLRegion?, CLGeocodeCompletionHandler)> where M1.MatchedType == String, M2.OptionalMatchedType == CLRegion, M3.MatchedType == CLGeocodeCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, CLRegion?, CLGeocodeCompletionHandler)>] = [wrap(matchable: addressString) { $0.0 }, wrap(matchable: region) { $0.1 }, wrap(matchable: completionHandler) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockCLGeocoder.self, method: "geocodeAddressString(_: String, in: CLRegion?, completionHandler: @escaping CLGeocodeCompletionHandler)", parameterMatchers: matchers))
        }

        func geocodeAddressString<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.Matchable>(_ addressString: M1, in region: M2, preferredLocale locale: M3, completionHandler: M4) -> Cuckoo.ProtocolStubNoReturnFunction<(String, CLRegion?, Locale?, CLGeocodeCompletionHandler)> where M1.MatchedType == String, M2.OptionalMatchedType == CLRegion, M3.OptionalMatchedType == Locale, M4.MatchedType == CLGeocodeCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, CLRegion?, Locale?, CLGeocodeCompletionHandler)>] = [wrap(matchable: addressString) { $0.0 }, wrap(matchable: region) { $0.1 }, wrap(matchable: locale) { $0.2 }, wrap(matchable: completionHandler) { $0.3 }]
            return .init(stub: cuckoo_manager.createStub(for: MockCLGeocoder.self, method: "geocodeAddressString(_: String, in: CLRegion?, preferredLocale: Locale?, completionHandler: @escaping CLGeocodeCompletionHandler)", parameterMatchers: matchers))
        }
    }

    struct __VerificationProxy_CLGeocoder: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        @discardableResult
        func geocodeAddressString<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ addressString: M1, completionHandler: M2) -> Cuckoo.__DoNotUse<(String, CLGeocodeCompletionHandler), Void> where M1.MatchedType == String, M2.MatchedType == CLGeocodeCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, CLGeocodeCompletionHandler)>] = [wrap(matchable: addressString) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return cuckoo_manager.verify("geocodeAddressString(_: String, completionHandler: @escaping CLGeocodeCompletionHandler)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }

        @discardableResult
        func geocodeAddressString<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable>(_ addressString: M1, in region: M2, completionHandler: M3) -> Cuckoo.__DoNotUse<(String, CLRegion?, CLGeocodeCompletionHandler), Void> where M1.MatchedType == String, M2.OptionalMatchedType == CLRegion, M3.MatchedType == CLGeocodeCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, CLRegion?, CLGeocodeCompletionHandler)>] = [wrap(matchable: addressString) { $0.0 }, wrap(matchable: region) { $0.1 }, wrap(matchable: completionHandler) { $0.2 }]
            return cuckoo_manager.verify("geocodeAddressString(_: String, in: CLRegion?, completionHandler: @escaping CLGeocodeCompletionHandler)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }

        @discardableResult
        func geocodeAddressString<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.Matchable>(_ addressString: M1, in region: M2, preferredLocale locale: M3, completionHandler: M4) -> Cuckoo.__DoNotUse<(String, CLRegion?, Locale?, CLGeocodeCompletionHandler), Void> where M1.MatchedType == String, M2.OptionalMatchedType == CLRegion, M3.OptionalMatchedType == Locale, M4.MatchedType == CLGeocodeCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, CLRegion?, Locale?, CLGeocodeCompletionHandler)>] = [wrap(matchable: addressString) { $0.0 }, wrap(matchable: region) { $0.1 }, wrap(matchable: locale) { $0.2 }, wrap(matchable: completionHandler) { $0.3 }]
            return cuckoo_manager.verify("geocodeAddressString(_: String, in: CLRegion?, preferredLocale: Locale?, completionHandler: @escaping CLGeocodeCompletionHandler)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class CLGeocoderStub: CLGeocoder {
    override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }

    override func geocodeAddressString(_ addressString: String, in region: CLRegion?, completionHandler: @escaping CLGeocodeCompletionHandler) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }

    override func geocodeAddressString(_ addressString: String, in region: CLRegion?, preferredLocale locale: Locale?, completionHandler: @escaping CLGeocodeCompletionHandler) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}
