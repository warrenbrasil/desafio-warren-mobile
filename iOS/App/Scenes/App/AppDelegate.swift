//
//  AppDelegate.swift
//  App
//
//  Created by Txai Wieser on 20/02/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let listViewController = MainViewController()
        let navController = AppNavigationController(rootViewController: listViewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

