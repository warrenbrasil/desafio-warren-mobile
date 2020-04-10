//
//  DefaultsKeyValueStore.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

public final class DefaultsKeyValueStore {
    
    public static let shared = DefaultsKeyValueStore(userDefaults: .standard)
    
    private let userDefaults: UserDefaults
    
    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
}

extension DefaultsKeyValueStore: KeyValueStore {
    
    func set(_ value: Any?, forKey key: KeyValueStoreKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func value(forKey key: KeyValueStoreKey) -> Any? {
        return userDefaults.value(forKey: key.rawValue)
    }
    
    func set(_ data: Data?, forKey key: KeyValueStoreKey) {
        userDefaults.set(data, forKey: key.rawValue)
    }
    
    func data(forKey key: KeyValueStoreKey) -> Data? {
        return userDefaults.data(forKey: key.rawValue)
    }
    
    func set(_ value: Bool?, forKey key: KeyValueStoreKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func bool(forKey key: KeyValueStoreKey) -> Bool? {
        return userDefaults.bool(forKey: key.rawValue)
    }
}
