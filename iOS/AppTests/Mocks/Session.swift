//
//  Session.swift
//  AppTests
//
//  Created by Alessandro Garcez on 10/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

@testable import Warren
import Foundation

extension Session {
    
    static func mock(accessToken: String? = ["A", "B", nil].randomElement()!,
                     refreshToken: String? = ["A", "B", nil].randomElement()!) -> Session {
        
        .init(accessToken: accessToken, refreshToken: refreshToken)
    }
}
