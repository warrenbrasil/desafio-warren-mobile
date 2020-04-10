//
//  Server.swift
//  App
//
//  Created by Alessandro Garcez on 10/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

struct Server {
    
    private static var domain: String { return "https://enigmatic-bayou-48219.herokuapp.com" }
    
    enum Endpoint {
        case logIn
        
        var url: String {
            switch self {
            case .logIn: return "\(Server.domain)/api/v2/account/login"
            }
        }
    }
}
