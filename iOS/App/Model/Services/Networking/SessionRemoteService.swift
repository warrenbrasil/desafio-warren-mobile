//
//  SessionRemoteService.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

protocol SessionRemoteService {
    
    @discardableResult func logIn(email: String,
                                  password: String,
                                  completion: @escaping (Result<Session, Error>) -> Void) -> OperationHandler?
}
