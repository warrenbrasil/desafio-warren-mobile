//
//  UIImageExtension.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

extension UIImageView {
    
    func loadAsync(url: String) {
        guard let _url = URL(string: url) else { return }
        af_setImage(withURL: _url)
    }
}
