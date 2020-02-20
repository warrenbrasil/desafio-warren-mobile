//
//  SceneDelegate.swift
//  App
//
//  Created by Txai Wieser on 20/02/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit
import SwiftUI
import App

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = RootViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

