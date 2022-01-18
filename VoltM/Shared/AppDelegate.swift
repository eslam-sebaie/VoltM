//
//  AppDelegate.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import UIKit
import IQKeyboardManagerSwift
import MOLH
import MFSDK
@main
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        MOLH.shared.activate(true)
        reset()
      // let token = "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL"
       let token = "rRAndsOqCRsns3pv0s7FoFUJkaqpQ_xDkNK29ix_eQpMBztA-BwCR39oVUTRePaTSPGllGH3IqQoY8VPLRuUwySQ6tFB7TRnJx0rk4usOmMiose95EmEntkJ-YZsH2bhDCgzAyp32AEKmOzE6Oo90wLH8bmTjuas6aDwuH5dJvcxO4lFCVy2fBmZP1QVq93Bnwn0sLDvBGrqh3jhAzsruTzB8f9GUVB28qNgdScdtV0zsWTKhT5gxFRZ8Rs2gVhJ_EHjg7fB0sykqIo4L82PSMBlo30VIS6rw1-L8o5Xj2Uvwm_sodWmIgsE-ZiDKXZqtKwZoBE0h870e0ahO4DV4GIrGcZI3prTMs8liT0rGHPvZqjvu2aCxOaS0u0xBqHiBir5kXC6fdlh6BsyhbjlByQiDsxk2BN8SFYs1Gmgk_3_NnPlXllt2Lp77v9k-GZD-hwdkipqT1QgXCm7uwllo_zN8hLZtcYHm5gCjhlt5wBU1FrMOg3vxgC-gwrfbH7r5psOFH4TLvBaV7TLP1Hs7YOg9es3A_rEbdX7fH4rDZ0A8UHW5JbnC_Q2C3vHAwAm2O7KplQDjoIo3YPzWZ_9XEAXe0pG-DWIWO52_rLLAEFN-w1AsvKjnOdFFWnBh8Km_75AcWKn4A1YMOjcJ8kn11xeB1PTloa_lmS_dFtxZq8pP1PT"
        MFSettings.shared.configure(token: token, country: .kuwait, environment: .live)
        

        // you can change color and title of nvgigation bar
        let them = MFTheme(navigationTintColor: .white, navigationBarTintColor: ColorName.bgColor.color, navigationTitle: "Payment", cancelButtonTitle: "Cancel")
        MFSettings.shared.setTheme(theme: them)
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if let paymentId = url[MFConstants.paymentId] {
            NotificationCenter.default.post(name: .applePayCheck, object: paymentId)
        }
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


