//
//  SessionService.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

final class SessionService: SessionManaging {
    
    private(set) static var shared: SessionService!
    
    private(set) var session: Session?
    
    private let remoteService: SessionRemoteService
    private let localStorageService: SessionStoring
    
    init(remoteService: SessionRemoteService, localStorageService: SessionStoring) {
        self.remoteService = remoteService
        self.localStorageService = localStorageService
        
        if let localSession = localStorageService.localSession {
            session = localSession
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        remoteService.logIn(email: email, password: password) { result in
            switch result {
            case .success(let session):
                self.session = session
                onBackgroundQueue { self.localStorageService.localSession = session }
            case .failure: completion(false)
            }
        }
    }
}
