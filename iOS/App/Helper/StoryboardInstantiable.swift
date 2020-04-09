//
//  StoryboardInstantiable.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiatable {
    static func instantiateFromStoryboard() -> Self
}

public extension StoryboardInstantiatable where Self: UIViewController {
    static func instantiateFromStoryboard() -> Self {
        let className = Utils.className(for: self)
        let storyboard = UIStoryboard(name: className, bundle: Bundle(for: self))
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
