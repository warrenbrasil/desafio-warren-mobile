//
//  DefaultsKeyValueStore+SessionStoring.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

extension DefaultsKeyValueStore: SessionStoring {
    
    var localSession: Session? {

        get {
            do {
                return try data(forKey: .session)?.decodeJSON()
            } catch {
                // Report this error to somewhere (Crashlytics)
                return nil
            }
        }
        
        set {
            do {
                if let value = newValue {
                    set(try Utils.defaultJSONEncoder.encode(value), forKey: .session)
                } else {
                    set(nil as Any?, forKey: .session)
                }
            } catch {
                // Report this error to somewhere
            }
        }
    }
}
