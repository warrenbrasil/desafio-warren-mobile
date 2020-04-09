//
//  DataRequestExtension.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    
    private func DecodableSerializer<T: Decodable>(_ keyPath: String?,
                                                    mapToObject object: T? = nil) -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, _, data, error in
            if let error = error {
                return .failure(error)
            }
            guard let data = data else {
                return .failure(ServerAPIError.undefined)
            }
            do {
                return .success(try JSONDecoder.Default.decode(T.self, from: data))
            } catch {
                return .failure(error)
            }
        }
    }
    
    @discardableResult
    public func responseObject<T: Decodable>(queue: DispatchQueue? = nil,
                                             keyPath: String? = nil,
                                             mapToObject object: T? = nil,
                                             completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue,
                        responseSerializer: DecodableSerializer(keyPath, mapToObject: object),
                        completionHandler: completionHandler)
    }
}
