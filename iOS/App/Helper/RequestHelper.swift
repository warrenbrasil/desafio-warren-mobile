//
//  RequestHelper.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation
import Alamofire

typealias HTTPMethod = Alamofire.HTTPMethod
typealias Parameters = Alamofire.Parameters
typealias JSONEncoding = Alamofire.JSONEncoding

protocol OperationHandler {
    func cancel()
}

struct RequestDescriptor {
    
    let url: String
    let method: HTTPMethod
    
    init(url: String,
         method: HTTPMethod = .get) {
        self.url = url
        self.method = method
    }
    
    func buildAlamofireRequest() throws -> DataRequest {
        guard let url = URL(string: url) else { throw ServerAPIError.wrongURLFormat }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return Alamofire.request(urlRequest).validate()
    }
    
}

class RequestHelper {
    
    static let shared = RequestHelper()
    
    @discardableResult func makeDecodableRequest<T: Decodable>(
        with descriptor: RequestDescriptor,
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (Swift.Result<T, Error>) -> Void
        ) -> OperationHandler? {
        do {
            return try descriptor.buildAlamofireRequest().responseObject(queue: queue) { (response: DataResponse<T>) in
                switch response.result {
                case .success(let value): completionHandler(.success(value))
                case .failure(let error): completionHandler(.failure(self.processError(error, bodyData: response.data)))
                }
            }
        } catch {
            completionHandler(.failure(processError(error)))
            return nil
        }
    }
    
    private func processError(_ error: Error, bodyData: Data? = nil) -> Error {
        var finalError = error
        let responseBodyData = bodyData?.decodeJSONDictionary() ?? [:]
        
        if let error = error as? AFError,
            case .responseValidationFailed(let reason) = error,
            case .unacceptableStatusCode(let code) = reason {
            finalError = NSError(domain: "", code: code, userInfo: responseBodyData)
        }
        return finalError
    }

}

