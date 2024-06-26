// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Accounts {
    internal static let premiumPlanIcon = ImageAsset(name: "Accounts/premiumPlan-icon")
    internal static let settingsIcon = ImageAsset(name: "Accounts/settings-icon")
    internal static let transactionHistoryIcon = ImageAsset(name: "Accounts/transactionHistory-icon")
  }
  internal enum Colors {
    internal static let primaryBlue = ColorAsset(name: "Colors/PrimaryBlue")
    internal static let primaryLightGray = ColorAsset(name: "Colors/PrimaryLightGray")
    internal static let primaryWhite = ColorAsset(name: "Colors/PrimaryWhite")
    internal static let accountBlue = ColorAsset(name: "Colors/accountBlue")
    internal static let disabled = ColorAsset(name: "Colors/disabled")
    internal static let heading = ColorAsset(name: "Colors/heading")
    internal static let subheading = ColorAsset(name: "Colors/subheading")
  }
  internal enum Home {
    internal static let homeExpenseIcon = ImageAsset(name: "Home/home-expense-icon")
    internal static let homeIncomeIcon = ImageAsset(name: "Home/home-income-icon")
    internal static let notificationIcon = ImageAsset(name: "Home/notification-icon")
    internal static let transactionLogo = ImageAsset(name: "Home/transaction-logo")
    internal static let userPlaceholder = ImageAsset(name: "Home/user-placeholder")
  }
  internal enum OnBoarding {
    internal enum Intro {
      internal static let background = ImageAsset(name: "OnBoarding/Intro/background")
      internal static let logo1 = ImageAsset(name: "OnBoarding/Intro/logo1")
      internal static let logo2 = ImageAsset(name: "OnBoarding/Intro/logo2")
    }
    internal static let line = ImageAsset(name: "OnBoarding/Line")
    internal static let appleIcon = ImageAsset(name: "OnBoarding/apple-icon")
    internal static let authBackground = ImageAsset(name: "OnBoarding/auth-background")
    internal static let emailIcon = ImageAsset(name: "OnBoarding/email-icon")
    internal static let facebookIcon = ImageAsset(name: "OnBoarding/facebook-icon")
    internal static let googleIcon = ImageAsset(name: "OnBoarding/google-icon")
    internal static let passwordIcon = ImageAsset(name: "OnBoarding/password-icon")
    internal static let usernameIcon = ImageAsset(name: "OnBoarding/username-icon")
    internal static let welcomeBackground = ImageAsset(name: "OnBoarding/welcome-background")
  }
  internal enum Recommendations {
    internal static let recommendationsIcon = ImageAsset(name: "Recommendations/recommendations-icon")
  }
  internal enum TabBar {
    internal static let budgetSelected = ImageAsset(name: "TabBar/budget-selected")
    internal static let budget = ImageAsset(name: "TabBar/budget")
    internal static let floatAddButton = ImageAsset(name: "TabBar/float-add-button")
    internal static let homeSelected = ImageAsset(name: "TabBar/home-selected")
    internal static let home = ImageAsset(name: "TabBar/home")
    internal static let insightsSelected = ImageAsset(name: "TabBar/insights-selected")
    internal static let insights = ImageAsset(name: "TabBar/insights")
    internal static let tabbarBackground = ImageAsset(name: "TabBar/tabbar-background")
    internal static let userSelected = ImageAsset(name: "TabBar/user-selected")
    internal static let user = ImageAsset(name: "TabBar/user")
  }
  internal static let backArrow = ImageAsset(name: "back-arrow")
  internal static let calendar = ImageAsset(name: "calendar")
  internal static let filterIcon = ImageAsset(name: "filter-icon")
  internal static let forwardArrow = ImageAsset(name: "forward-arrow")
  internal static let walletIcon = ImageAsset(name: "wallet-icon")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
