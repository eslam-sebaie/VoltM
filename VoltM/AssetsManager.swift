// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
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
  internal static let _1 = ImageAsset(name: "1")
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let apple = ImageAsset(name: "Apple")
  internal static let addToCart = ImageAsset(name: "add-to-cart")
  internal static let addressIcon = ImageAsset(name: "addressIcon")
  internal static let cartIcon = ImageAsset(name: "cartIcon")
  internal static let love = ImageAsset(name: "love")
  internal static let productFav = ImageAsset(name: "productFav")
  internal static let search = ImageAsset(name: "search")
  internal static let selectMenu = ImageAsset(name: "selectMenu")
  internal static let electronicDevices = ImageAsset(name: "Electronic Devices")
  internal static let facebook = ImageAsset(name: "Facebook")
  internal static let gmail = ImageAsset(name: "Gmail")
  internal static let bg1 = ImageAsset(name: "BG1")
  internal static let bg2 = ImageAsset(name: "BG2")
  internal static let service = ImageAsset(name: "Service")
  internal static let cart = ImageAsset(name: "cart")
  internal static let cartAr = ImageAsset(name: "cartAr")
  internal static let circle = DataAsset(name: "circle")
  internal static let fav = ImageAsset(name: "fav")
  internal static let favAr = ImageAsset(name: "favAr")
  internal static let home = ImageAsset(name: "home")
  internal static let homeAr = ImageAsset(name: "homeAr")
  internal static let homeIcon = ImageAsset(name: "homeIcon")
  internal static let love1 = ImageAsset(name: "love1")
  internal static let offerAr = ImageAsset(name: "offerAr")
  internal static let offers = ImageAsset(name: "offers")
  internal static let selectCart = ImageAsset(name: "selectCart")
  internal static let selectFav = ImageAsset(name: "selectFav")
  internal static let selectHome = ImageAsset(name: "selectHome")
  internal static let selectService = ImageAsset(name: "selectService")
  internal static let selectStore = ImageAsset(name: "selectStore")
  internal static let selectedCartAr = ImageAsset(name: "selectedCartAr")
  internal static let selectedFavAr = ImageAsset(name: "selectedFavAr")
  internal static let selectedHomeAr = ImageAsset(name: "selectedHomeAr")
  internal static let selectedServiceAr = ImageAsset(name: "selectedServiceAr")
  internal static let selectedStoreAr = ImageAsset(name: "selectedStoreAr")
  internal static let seperate = ImageAsset(name: "seperate")
  internal static let serviceAr = ImageAsset(name: "serviceAr")
  internal static let serviceBG = ImageAsset(name: "serviceBG")
  internal static let shop = ImageAsset(name: "shop")
  internal static let sideMenuIcon = ImageAsset(name: "sideMenuIcon")
  internal static let store = ImageAsset(name: "store")
  internal static let storeAR = ImageAsset(name: "storeAR")
  internal static let storeBG1 = ImageAsset(name: "storeBG1")
  internal static let tools = ImageAsset(name: "tools")
  internal static let location = ImageAsset(name: "Location")
  internal static let locationpin = ImageAsset(name: "Locationpin")
  internal static let aboutImg = ImageAsset(name: "aboutImg")
  internal static let accountImg = ImageAsset(name: "accountImg")
  internal static let addressIcon2 = ImageAsset(name: "addressIcon2")
  internal static let colorLine = ImageAsset(name: "colorLine")
  internal static let countryImg = ImageAsset(name: "countryImg")
  internal static let emailIcon = ImageAsset(name: "emailIcon")
  internal static let eye = ImageAsset(name: "eye")
  internal static let languageImg = ImageAsset(name: "languageImg")
  internal static let logoVoltm = ImageAsset(name: "logoVoltm")
  internal static let nameIcon = ImageAsset(name: "nameIcon")
  internal static let offerImg = ImageAsset(name: "offerImg")
  internal static let orderImg = ImageAsset(name: "orderImg")
  internal static let passIcon = ImageAsset(name: "passIcon")
  internal static let privacyImage = ImageAsset(name: "privacyImage")
  internal static let supportImg = ImageAsset(name: "supportImg")
  internal static let underline = ImageAsset(name: "underline")
  internal static let mobileLoginCuate = ImageAsset(name: "Mobile login-cuate")
  internal static let name = ImageAsset(name: "Name")
  internal static let back = ImageAsset(name: "back")
  internal static let backAr = ImageAsset(name: "backAr")
  internal static let heart = ImageAsset(name: "heart")
  internal static let offerHeader = ImageAsset(name: "offerHeader")
  internal static let offerHeaderAr = ImageAsset(name: "offerHeaderAr")
  internal static let shopIcon = ImageAsset(name: "shopIcon")
  internal static let photo = ImageAsset(name: "Photo")
  internal static let pin = ImageAsset(name: "Pin")
  internal static let cancelIcon = ImageAsset(name: "cancelIcon")
  internal static let cash = ImageAsset(name: "cash")
  internal static let check = ImageAsset(name: "check")
  internal static let delivery = ImageAsset(name: "delivery")
  internal static let egypt = ImageAsset(name: "egypt")
  internal static let egypt2 = ImageAsset(name: "egypt2")
  internal static let fillStar = ImageAsset(name: "fillStar")
  internal static let kwait = ImageAsset(name: "kwait")
  internal static let kwait2 = ImageAsset(name: "kwait2")
  internal static let lebanon = ImageAsset(name: "lebanon")
  internal static let logo1 = ImageAsset(name: "logo1")
  internal static let mapIcon = ImageAsset(name: "mapIcon")
  internal static let mobiles = ImageAsset(name: "mobiles")
  internal static let orderAddress = ImageAsset(name: "orderAddress")
  internal static let orderDetailsAr = ImageAsset(name: "orderDetailsAr")
  internal static let orderDetailsEn = ImageAsset(name: "orderDetailsEn")
  internal static let ordersHeaderAr = ImageAsset(name: "ordersHeaderAr")
  internal static let ordersHeaderEn = ImageAsset(name: "ordersHeaderEn")
  internal static let phoneIcon = ImageAsset(name: "phoneIcon")
  internal static let qatar = ImageAsset(name: "qatar")
  internal static let saudiArabia = ImageAsset(name: "saudi-arabia")
  internal static let storeBG = ImageAsset(name: "storeBG")
  internal static let syria = ImageAsset(name: "syria")
  internal static let uncheck = ImageAsset(name: "uncheck")
  internal static let unfillStar = ImageAsset(name: "unfillStar")
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

internal struct DataAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(macOS)
  @available(iOS 9.0, macOS 10.11, *)
  internal var data: NSDataAsset {
    guard let data = NSDataAsset(asset: self) else {
      fatalError("Unable to load data asset named \(name).")
    }
    return data
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(macOS)
@available(iOS 9.0, macOS 10.11, *)
internal extension NSDataAsset {
  convenience init?(asset: DataAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(macOS)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
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
}

internal extension ImageAsset.Image {
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
