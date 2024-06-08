//
//  NetworkManager.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 05/06/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared: NetworkManager = .init()
    private let session: Session
    
    private init() {
        session = Session(interceptor: BookStoreInterceptor())
    }
    
    func request<T: Codable>(endPoint: BookStoreEndPoint,
                 onSuccess: @escaping (T) -> (),
                 onFailure: @escaping (NetworkError) -> ())
    {
        session.request(endPoint, method: endPoint.method, parameters: endPoint.parameters, encoding: endPoint.encoding, headers: endPoint.header)
            .validate({ request, response, data in
                if response.statusCode == 401 {
                    return .failure(NetworkError.UNEXPECTED_STATUS_CODE(response.statusCode))
                }
                else {
                    return .success(())
                }
            })
            .response { afResponse in
                if let statusCode = afResponse.response?.statusCode {
                    if 200..<300 ~= statusCode {
                        if let data = afResponse.data {
                            let object: T? =  try? JSONDecoder().decode(T.self, from: data)
                            if let object = object {
                                onSuccess(object)
                            }
                            else {
                                onFailure(.DECODE_ERROR)
                            }
                        }
                        else {
                            onFailure(.EMPTY_RESPONSE)
                        }
                    }
                    else {
                        onFailure(.UNEXPECTED_STATUS_CODE(statusCode))
                    }
                }
                else {
                    onFailure(.EMPTY_RESPONSE)
                }
            }
    }
}
