//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Mehmet Tarhan on 30.04.2021.
//

import UIKit

// @main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print(#function)

        return true
    }

    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        print(#function)

        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function)

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }
}
