//
//  SessionStoringMock.swift
//  AppTests
//
//  Created by Alessandro Garcez on 10/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

@testable import Warren
import Foundation

class SessionStoringMock: SessionStoring {
    
    var localSession: Session?
}
