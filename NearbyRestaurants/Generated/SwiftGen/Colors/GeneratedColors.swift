// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b75374"></span>
  /// Alpha: 100% <br/> (0xb75374ff)
  internal static let appRed = ColorName(rgbaValue: 0xb75374ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ba3335"></span>
  /// Alpha: 100% <br/> (0xba3335ff)
  internal static let barTintColor = ColorName(rgbaValue: 0xba3335ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 80% <br/> (0x000000cc)
  internal static let black100trans80 = ColorName(rgbaValue: 0x000000cc)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f70d1a"></span>
  /// Alpha: 100% <br/> (0xf70d1aff)
  internal static let candyAppleRed = ColorName(rgbaValue: 0xf70d1aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#051315"></span>
  /// Alpha: 90% <br/> (0x051315e6)
  internal static let charcoal100trans90 = ColorName(rgbaValue: 0x051315e6)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#50595b"></span>
  /// Alpha: 100% <br/> (0x50595bff)
  internal static let charcoal70 = ColorName(rgbaValue: 0x50595bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1e2a2c"></span>
  /// Alpha: 100% <br/> (0x1e2a2cff)
  internal static let charcoal90 = ColorName(rgbaValue: 0x1e2a2cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#141414"></span>
  /// Alpha: 100% <br/> (0x141414ff)
  internal static let chineseBlack = ColorName(rgbaValue: 0x141414ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f46f60"></span>
  /// Alpha: 100% <br/> (0xf46f60ff)
  internal static let coral = ColorName(rgbaValue: 0xf46f60ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d93d5a"></span>
  /// Alpha: 100% <br/> (0xd93d5aff)
  internal static let darkRed = ColorName(rgbaValue: 0xd93d5aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#141414"></span>
  /// Alpha: 100% <br/> (0x141414ff)
  internal static let dimBlackColor = ColorName(rgbaValue: 0x141414ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a3a4a8"></span>
  /// Alpha: 100% <br/> (0xa3a4a8ff)
  internal static let grayChateau = ColorName(rgbaValue: 0xa3a4a8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d8d8d8"></span>
  /// Alpha: 100% <br/> (0xd8d8d8ff)
  internal static let lightSilver = ColorName(rgbaValue: 0xd8d8d8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#01ffff"></span>
  /// Alpha: 100% <br/> (0x01ffffff)
  internal static let neon100 = ColorName(rgbaValue: 0x01ffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d93d5a"></span>
  /// Alpha: 100% <br/> (0xd93d5aff)
  internal static let onboardingRed = ColorName(rgbaValue: 0xd93d5aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ef8136"></span>
  /// Alpha: 100% <br/> (0xef8136ff)
  internal static let orange = ColorName(rgbaValue: 0xef8136ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ef8136"></span>
  /// Alpha: 100% <br/> (0xef8136ff)
  internal static let primary = ColorName(rgbaValue: 0xef8136ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33ff99"></span>
  /// Alpha: 100% <br/> (0x33ff99ff)
  internal static let rarthGreen100 = ColorName(rgbaValue: 0x33ff99ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d0021b"></span>
  /// Alpha: 100% <br/> (0xd0021bff)
  internal static let redEnergy100 = ColorName(rgbaValue: 0xd0021bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fff572"></span>
  /// Alpha: 100% <br/> (0xfff572ff)
  internal static let strikingYellow100 = ColorName(rgbaValue: 0xfff572ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#00c5cd"></span>
  /// Alpha: 100% <br/> (0x00c5cdff)
  internal static let turquoiseSurf = ColorName(rgbaValue: 0x00c5cdff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5f5f5"></span>
  /// Alpha: 100% <br/> (0xf5f5f5ff)
  internal static let whiteSmoke = ColorName(rgbaValue: 0xf5f5f5ff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
