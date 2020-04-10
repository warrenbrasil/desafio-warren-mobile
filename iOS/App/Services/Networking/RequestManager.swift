//
//  RequestManager.swift
//  App
//
//  Created by Alessandro Garcez on 10/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

public final class RequestManager {
    
    public static let shared = RequestManager()
    
    enum Error: Swift.Error {
        case invalidCredentials
    }
}
