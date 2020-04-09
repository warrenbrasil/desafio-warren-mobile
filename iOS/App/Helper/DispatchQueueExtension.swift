//
//  DispatchQueueExtension.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    static var background: DispatchQueue { return DispatchQueue(label: "requests", qos: .background) }
    
}
