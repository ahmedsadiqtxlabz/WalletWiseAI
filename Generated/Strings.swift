// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Accounts {
    /// Monthly Budget
    internal static let budgetTitle = L10n.tr("Localizable", "accounts.budgetTitle", fallback: "Monthly Budget")
    /// Expenses
    internal static let expenses = L10n.tr("Localizable", "accounts.expenses", fallback: "Expenses")
    /// Income
    internal static let income = L10n.tr("Localizable", "accounts.income", fallback: "Income")
    /// Accounts
    internal static let title = L10n.tr("Localizable", "accounts.title", fallback: "Accounts")
    internal enum Options {
      /// Transaction History
      internal static let history = L10n.tr("Localizable", "accounts.options.history", fallback: "Transaction History")
      /// Premium Plans
      internal static let plans = L10n.tr("Localizable", "accounts.options.plans", fallback: "Premium Plans")
    }
  }
  internal enum Home {
    /// Available Funds
    internal static let availableFunds = L10n.tr("Localizable", "home.availableFunds", fallback: "Available Funds")
    /// Recent Transactions
    internal static let recentTransactions = L10n.tr("Localizable", "home.recentTransactions", fallback: "Recent Transactions")
    /// Expenses
    internal static let summaryExpenses = L10n.tr("Localizable", "home.summaryExpenses", fallback: "Expenses")
    /// Income
    internal static let summaryIncome = L10n.tr("Localizable", "home.summaryIncome", fallback: "Income")
    /// Monthly Summary
    internal static let summaryTitle = L10n.tr("Localizable", "home.summaryTitle", fallback: "Monthly Summary")
    /// Total Balance
    internal static let totalBalance = L10n.tr("Localizable", "home.totalBalance", fallback: "Total Balance")
  }
  internal enum Onboarding {
    internal enum Intro {
      /// Next
      internal static let button1 = L10n.tr("Localizable", "onboarding.intro.button1", fallback: "Next")
      /// Get Started
      internal static let button2 = L10n.tr("Localizable", "onboarding.intro.button2", fallback: "Get Started")
      /// WalletWise uses AI for personalized expense insights and recommendations based on spending patterns.
      internal static let detail1 = L10n.tr("Localizable", "onboarding.intro.detail1", fallback: "WalletWise uses AI for personalized expense insights and recommendations based on spending patterns.")
      /// WalletWise integrates with Apple Wallet for seamless transaction import, streamlining expense tracking.
      internal static let detail2 = L10n.tr("Localizable", "onboarding.intro.detail2", fallback: "WalletWise integrates with Apple Wallet for seamless transaction import, streamlining expense tracking.")
      /// AI Expense Tracker & Budget Planner
      internal static let title1 = L10n.tr("Localizable", "onboarding.intro.title1", fallback: "AI Expense Tracker & Budget Planner")
      /// WalletWise with Apple Wallet
      internal static let title2 = L10n.tr("Localizable", "onboarding.intro.title2", fallback: "WalletWise with Apple Wallet")
    }
    internal enum Signin {
      /// Or continue with
      internal static let continueText = L10n.tr("Localizable", "onboarding.signin.continueText", fallback: "Or continue with")
      /// Email
      internal static let emailText = L10n.tr("Localizable", "onboarding.signin.emailText", fallback: "Email")
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
    internal enum Validations {
      /// Email cannot be empty.
      internal static let emptyEmail = L10n.tr("Localizable", "onboarding.validations.emptyEmail", fallback: "Email cannot be empty.")
      /// Password cannot be empty.
      internal static let emptyPassword = L10n.tr("Localizable", "onboarding.validations.emptyPassword", fallback: "Password cannot be empty.")
      /// Full name cannot be empty.
      internal static let fullName = L10n.tr("Localizable", "onboarding.validations.fullName", fallback: "Full name cannot be empty.")
      /// Email is not valid.
      internal static let invalidEmail = L10n.tr("Localizable", "onboarding.validations.invalidEmail", fallback: "Email is not valid.")
      /// Password must be at least 8 characters long.
      internal static let invalidPassword = L10n.tr("Localizable", "onboarding.validations.invalidPassword", fallback: "Password must be at least 8 characters long.")
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
  internal enum Tabbar {
    internal enum Title {
      /// Home
      internal static let _1 = L10n.tr("Localizable", "tabbar.title.1", fallback: "Home")
      /// AI Insights
      internal static let _2 = L10n.tr("Localizable", "tabbar.title.2", fallback: "AI Insights")
      /// Budget
      internal static let _3 = L10n.tr("Localizable", "tabbar.title.3", fallback: "Budget")
      /// Account
      internal static let _4 = L10n.tr("Localizable", "tabbar.title.4", fallback: "Account")
    }
  }
  internal enum Transactions {
    internal enum Filters {
      /// All
      internal static let _1 = L10n.tr("Localizable", "transactions.filters.1", fallback: "All")
      /// Food
      internal static let _2 = L10n.tr("Localizable", "transactions.filters.2", fallback: "Food")
      /// Shopping
      internal static let _3 = L10n.tr("Localizable", "transactions.filters.3", fallback: "Shopping")
      /// Entertainment
      internal static let _4 = L10n.tr("Localizable", "transactions.filters.4", fallback: "Entertainment")
      /// Apply
      internal static let buttonTitle = L10n.tr("Localizable", "transactions.filters.buttonTitle", fallback: "Apply")
      /// From
      internal static let from = L10n.tr("Localizable", "transactions.filters.from", fallback: "From")
      /// To
      internal static let to = L10n.tr("Localizable", "transactions.filters.to", fallback: "To")
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
