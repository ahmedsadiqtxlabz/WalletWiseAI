// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Onboarding {
    internal enum Signin {
      /// Or continue with
      internal static let continueText = L10n.tr("Localizable", "onboarding.signin.continueText", fallback: "Or continue with")
      /// Email or Username
      internal static let emailText = L10n.tr("Localizable", "onboarding.signin.emailText", fallback: "Email or Username")
      /// Forgot password?
      internal static let forgetPassword = L10n.tr("Localizable", "onboarding.signin.forgetPassword", fallback: "Forgot password?")
      /// Full Name
      internal static let fullName = L10n.tr("Localizable", "onboarding.signin.fullName", fallback: "Full Name")
      /// Already have an account?
      internal static let haveAccount = L10n.tr("Localizable", "onboarding.signin.haveAccount", fallback: "Already have an account?")
      /// Don't have an account?
      internal static let noAccountText = L10n.tr("Localizable", "onboarding.signin.noAccountText", fallback: "Don't have an account?")
      /// Password
      internal static let password = L10n.tr("Localizable", "onboarding.signin.password", fallback: "Password")
    }
    internal enum Welcome {
      /// Introducing our AI-powered Expense Tracker and Budget Planner app.
      internal static let description = L10n.tr("Localizable", "onboarding.welcome.description", fallback: "Introducing our AI-powered Expense Tracker and Budget Planner app.")
      /// Sign In
      internal static let signin = L10n.tr("Localizable", "onboarding.welcome.signin", fallback: "Sign In")
      /// Sign Up
      internal static let signup = L10n.tr("Localizable", "onboarding.welcome.signup", fallback: "Sign Up")
      /// Welcome!
      internal static let title = L10n.tr("Localizable", "onboarding.welcome.title", fallback: "Welcome!")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
