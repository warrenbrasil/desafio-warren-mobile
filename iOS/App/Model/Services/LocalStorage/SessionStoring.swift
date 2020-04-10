//
//  SessionStoring.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

protocol SessionStoring: class {
    var localSession: Session? { get set }
}
