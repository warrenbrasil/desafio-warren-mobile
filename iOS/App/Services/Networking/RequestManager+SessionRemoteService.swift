//
//  RequestManager+SessionRemoteService.swift
//  App
//
//  Created by Alessandro Garcez on 10/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

extension RequestManager: SessionRemoteService {
    
    func logIn(email: String,
               password: String,
               completion: @escaping (Result<Session, Swift.Error>) -> Void) -> OperationHandler? {
        
        let request: Server.Endpoint = .logIn
        return RequestHelper.shared.makeDecodableRequest(with: RequestDescriptor(url: request.url, method: .post),
                                                         completionHandler: completion)
    }
}
