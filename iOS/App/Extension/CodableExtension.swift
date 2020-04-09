//
//  CodableExtension.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static let Default: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Utils.defaultDateFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

extension JSONEncoder {
    static let Default: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(Utils.defaultDateFormatter)
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
}

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder.Default.encode(self)
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return json as? [String: Any] ?? [:]
    }
}

extension Decodable {
    static func fromDictionary(_ dictionary: [String: Any]) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        return try JSONDecoder.Default.decode(Self.self, from: data)
    }
    
    static func fromDictionaryArray(_ dictArray: [[String: Any]]?) -> [Self] {
        guard let dictArray = dictArray else { return [] }
        return dictArray.compactMap { try? fromDictionary($0) }
    }
}
