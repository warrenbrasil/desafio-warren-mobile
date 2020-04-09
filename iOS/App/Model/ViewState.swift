//
//  ViewState.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

enum ViewState<T,U> {
    case success(T)
    case failure(U)
    case loading
    
    var isSuccess: Bool {
        switch self {
        case .success: return true
        default: return false
        }
    }
    
    var isFailure: Bool {
        switch self {
        case .failure: return true
        default: return false
        }
    }
    
    var isloading: Bool {
        switch self {
        case .loading: return true
        default: return false
        }
    }
}
