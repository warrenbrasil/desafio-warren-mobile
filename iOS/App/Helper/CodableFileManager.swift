//
//  CodableFileManager.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

class CodableFileManager {
    
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    static let shared: CodableFileManager = .init(encoder: JSONEncoder.Default,
                                                  decoder: JSONDecoder.Default)
    
    init(encoder: JSONEncoder, decoder: JSONDecoder) {
        self.encoder = encoder
        self.decoder = decoder
    }
    
    func save<T: Encodable>(_ encodable: T, to filePath: FilePath) throws {
        do {
            let data = try JSONEncoder().encode(encodable)
            try data.write(to: filePath.url)
        } catch {
            print("Got an error while caching the data. error: \(error)")
            throw error
        }
    }
    
    func retrieve<T: Decodable>(from filePath: FilePath) throws -> T {
        do {
            let data = try Data(contentsOf: filePath.url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Got an error while retrieving the data. error: \(error)")
            throw error
        }
    }
}

enum FilePath: String {
    //TODO: Remove this var after implementing local storage
    case genre
    public var url: URL {
        let cacheDir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return cacheDir.appendingPathComponent(rawValue)
    }
}

