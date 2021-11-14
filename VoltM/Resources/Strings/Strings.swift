// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// catName
  internal static let catName = L10n.tr("Localizable", "catName")
  /// Email Or Password Is Wrong.
  internal static let emailOrPasswordIsWrong = L10n.tr("Localizable", "Email Or Password Is Wrong.")
  /// Email Or Phone are Aleardy Token.
  internal static let emailOrPhoneAreAleardyToken = L10n.tr("Localizable", "Email Or Phone are Aleardy Token.")
  /// InCorrect Email
  internal static let inCorrectEmail = L10n.tr("Localizable", "InCorrect Email")
  /// InCorrect Password
  internal static let inCorrectPassword = L10n.tr("Localizable", "InCorrect Password")
  /// lang
  internal static let lang = L10n.tr("Localizable", "lang")
  /// No Result Found
  internal static let noResultFound = L10n.tr("Localizable", "No Result Found")
  /// NoCategories
  internal static let noCategories = L10n.tr("Localizable", "NoCategories")
  /// noproductName
  internal static let noproductName = L10n.tr("Localizable", "noproductName")
  /// NoStores
  internal static let noStores = L10n.tr("Localizable", "NoStores")
  /// noSubCat
  internal static let noSubCat = L10n.tr("Localizable", "noSubCat")
  /// OK
  internal static let ok = L10n.tr("Localizable", "OK")
  /// Please
  internal static let please = L10n.tr("Localizable", "Please")
  /// Please Enter Address
  internal static let pleaseEnterAddress = L10n.tr("Localizable", "Please Enter Address")
  /// Please Enter FirstName
  internal static let pleaseEnterFirstName = L10n.tr("Localizable", "Please Enter FirstName")
  /// Please Enter LastName
  internal static let pleaseEnterLastName = L10n.tr("Localizable", "Please Enter LastName")
  /// Please Enter Password
  internal static let pleaseEnterPassword = L10n.tr("Localizable", "Please Enter Password")
  /// Please Enter Phone
  internal static let pleaseEnterPhone = L10n.tr("Localizable", "Please Enter Phone")
  /// productName
  internal static let productName = L10n.tr("Localizable", "productName")
  /// Service
  internal static let service = L10n.tr("Localizable", "Service")
  /// Sign in into your Account
  internal static let signInLabel = L10n.tr("Localizable", "signInLabel")
  /// Sorry
  internal static let sorry = L10n.tr("Localizable", "Sorry")
  /// Store
  internal static let store = L10n.tr("Localizable", "Store")
  /// StoreName
  internal static let storeName = L10n.tr("Localizable", "StoreName")
  /// subCatName
  internal static let subCatName = L10n.tr("Localizable", "subCatName")
  /// Upload Your Image.
  internal static let uploadYourImage = L10n.tr("Localizable", "Upload Your Image.")
  /// WentWrong
  internal static let wentWrong = L10n.tr("Localizable", "WentWrong")
  /// Wrong Email
  internal static let wrongEmail = L10n.tr("Localizable", "Wrong Email")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
