//
//  LocalStorageService.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

protocol KeyValueStore {
    
    func set(_ data: Data?, forKey key: KeyValueStoreKey)
    func data(forKey key: KeyValueStoreKey) -> Data?
    
    func set(_ value: Bool?, forKey key: KeyValueStoreKey)
    func bool(forKey key: KeyValueStoreKey) -> Bool?
    
    func set(_ value: Any?, forKey key: KeyValueStoreKey)
    func value(forKey key: KeyValueStoreKey) -> Any?
}

enum KeyValueStoreKey: String {
    case session
}

