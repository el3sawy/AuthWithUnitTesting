//
//  AppDelegate.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let loginViewController = AuthConfigurator.getViewController(type: .login)
        let navigation = UINavigationController(rootViewController: loginViewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}
