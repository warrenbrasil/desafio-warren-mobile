//
//  SessionRemoteServiceMock.swift
//  AppTests
//
//  Created by Alessandro Garcez on 10/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

@testable import Warren
import Foundation

class SessionRemoteServiceMock: SessionRemoteService {
    
    var mockedResult: Result<Session, Error> = .success(.mock())
    
    func logIn(email: String,
               password: String,
               completion: @escaping (Result<Session, Error>) -> Void) -> OperationHandler? {
        
        completion(mockedResult)
        return nil
    }
    
    
}
