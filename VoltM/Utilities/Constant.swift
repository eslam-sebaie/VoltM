//
//  Constant.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import Foundation


// Storyboards
struct Storyboards {
    static let main = "Main"
    static let home = "Home"
    static let offer = "Offers"
    static let products = "Products"
    static let sideMenu = "SideMenu"
    static let account = "Account"
    static let Orders = "Orders"
}

// View Controllers
struct ViewControllers {
    static let welcomeVC = "WelcomeVC"
    static let signInVC = "SignInVC"
    static let signUpVC = "SignUpVC"
    static let homeVC = "HomeVC"
    static let offerVC = "OfferVC"
    static let mainCategoryVC = "MainCategoryVC"
    static let storeVC = "StoreVC"
    static let favoriteVC = "FavoriteVC"
    static let storeCategoryVC = "StoreCategoryVC"
    static let storeSubCategoryVC = "StoreSubCategoryVC"
    static let cartVC = "CartVC"
    static let productVC = "ProductVC"
    static let productDetailsVC = "ProductDetailsVC"
    static let sideMenuVC = "SideMenuVC"
    static let languageVC = "LanguageVC"
    static let countryVC = "CountryVC"
    static let updateInfoVC = "UpdateInfoVC"
    static let updateAddressVC = "UpdateAddressVC"
    static let updateContactVC = "UpdateContactVC"
    static let rateVC = "RateVC"
    static let ordersVC = "OrdersVC"
    static let orderDetailsVC = "OrderDetailsVC"
    static let chooseCountryVC = "ChooseCountryVC"
    static let pagesVC = "PagesVC"
}
struct URLs {
    // MARK:- base
    static let base = "https://voltm7.com/api/"
    static let userSignUp = "register"
    static let login = "login"
    static let Countries = "getAllCountries"
    static let MainCategories = "getAllMainCategories"
    static let getAllStores = "getAllStores"
    static let getAllCategories = "getAllCategories"
    static let getAllSubCategories = "getAllSubCategories"
    static let searchStore = "store/name/country_id"
    static let searchCat = "category/name/store_id"
    static let searchSubCat = "subCategory/name/category_id"
    static let getProducts = "product/subCategory_id"
    static let searchProducts = "product/name/subCategory_id"
    static let sendReview = "add/review/product"
    static let getReview = "reviews/product"
    static let getUser = "get/user/profile"
    static let updateUser = "user/id"
    static let allCountriesSrores = "getAllStoress"
  
}
struct ParameterKeys {
   
    
}
struct HeaderKeys {
    static let acceptLanguage = "en"
    static let Authorization = "Authorization"
}
struct UserDefaultsKeys {
    static let token = "token"
    static let email = "email"
    static let phone = "phone"
    static let password = "password"
    static let country = "country"
    static let countryId = "countryId"
    static let userId = "userId"
    
}
struct TableCells {
    static let homeCell = "cell"
}
struct Language {
    static let arabic = "ar"
    static let english = "en"
}

