//
//  AppNavigationController.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

private var titleColor: UIColor { return .appDark }
private var tintColor: UIColor { return .appDark }

class AppNavigationController: UINavigationController {

    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commomInit() {
        navigationBar.isTranslucent = false
        navigationBar.tintColor = tintColor
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: tintColor], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: tintColor], for: .highlighted)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: titleColor]
    }

}
