//
//  SessionManaging.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

protocol SessionManaging {
    
    var session: Session? { get }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void)
}
