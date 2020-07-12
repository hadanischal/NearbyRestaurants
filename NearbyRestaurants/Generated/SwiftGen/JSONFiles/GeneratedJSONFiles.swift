// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - JSON Files

// swiftlint:disable identifier_name line_length type_body_length
internal enum JSONFiles {
  internal enum Collections {
    private static let _document = JSONDocument(path: "collections.json")
    internal static let collections: [[String: Any]] = _document["collections"]
    internal static let displayText: String = _document["display_text"]
    internal static let hasMore: Int = _document["has_more"]
    internal static let hasTotal: Int = _document["has_total"]
    internal static let shareUrl: String = _document["share_url"]
    internal static let userHasAddresses: Bool = _document["user_has_addresses"]
  }
  internal enum Restaurants {
    private static let _document = JSONDocument(path: "restaurants.json")
    internal static let restaurants: [[String: Any]] = _document["restaurants"]
    internal static let resultsFound: Int = _document["results_found"]
    internal static let resultsShown: Int = _document["results_shown"]
    internal static let resultsStart: Int = _document["results_start"]
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

private func objectFromJSON<T>(at path: String) -> T {
  let bundle = BundleToken.bundle
  guard let url = bundle.url(forResource: path, withExtension: nil),
    let json = try? JSONSerialization.jsonObject(with: Data(contentsOf: url), options: []),
    let result = json as? T else {
    fatalError("Unable to load JSON at path: \(path)")
  }
  return result
}

private struct JSONDocument {
  let data: [String: Any]

  init(path: String) {
    self.data = objectFromJSON(at: path)
  }

  subscript<T>(key: String) -> T {
    guard let result = data[key] as? T else {
      fatalError("Property '\(key)' is not of type \(T.self)")
    }
    return result
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
