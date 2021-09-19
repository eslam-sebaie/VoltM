//
//  AppDelegate.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import UIKit
import IQKeyboardManagerSwift
import MOLH
@main
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        MOLH.shared.activate(true)
        reset()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func reset() {
//        let rootViewController: UIWindow = ((UIApplication.shared.delegate?.window)) as! UIWindow
//        let story = UIStoryboard(name: "Offers", bundle: nil)
//        rootViewController.rootViewController = story.instantiateViewController(withIdentifier: "OfferVC")
        
    }
    
}

extension AppDelegate {
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}


