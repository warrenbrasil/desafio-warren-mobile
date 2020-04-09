//
//  NibInstantiatable.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation
import UIKit

protocol NibInstantiatable {
    static func instantiateFromNib() -> Self?
}

extension NibInstantiatable where Self: UIView {
    static func instantiateFromNib() -> Self? {
        let nibName = className(for: Self.self)
        let arrayViews =  UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil)
        return arrayViews.first as? Self
    }
    
    static func className(for _class: AnyClass) -> String {
        let str = String(describing: type(of: _class))
        guard str.hasSuffix(".Type") else {
            return str
        }
        return String(str[..<str.index(str.endIndex, offsetBy: -5)])
    }
}
