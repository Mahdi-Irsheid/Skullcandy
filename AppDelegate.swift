//
//  AppDelegate.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Firebase
import FirebaseCore
import IQKeyboardManagerSwift
import MOLH

var remoteConfig = RemoteConfig.remoteConfig()
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //keyboard global settings
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 50
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        FirebaseApp.configure()
        return true
    }
    func reset() {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBar = storyboard.instantiateViewController(identifier: Constants.Storyboard.tabBar) as? TabBarViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()
    }
}

