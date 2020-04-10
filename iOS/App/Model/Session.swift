//
//  Session.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

struct Session: Codable, Equatable {
    let accessToken: String?
    let refreshToken: String?
}
