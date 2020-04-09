//
//  ServerAPIError.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Alessandro Garcez. All rights reserved.
//

enum ServerAPIError: Swift.Error {
    case wrongURLFormat
    case undefined
    case wrongAnswerFormat(Any?)
}
