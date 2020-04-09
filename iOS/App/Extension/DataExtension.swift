//
//  DataExtension.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

extension Data {
    
    func decodeJSON() -> [String: Any]? {
        let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments)
        return jsonObject as? [String: Any]
    }
    
    static func fromURL(_ url: URL) -> Data? {
        do {
            return try Data(contentsOf: url)
        } catch {
            return nil
        }
    }
}
