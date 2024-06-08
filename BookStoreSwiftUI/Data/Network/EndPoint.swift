//
//  EndPoint.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 05/06/2024.
//

import Foundation
import Alamofire

protocol EndPoint: URLConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var header: Alamofire.HTTPHeaders? { get }
    var method: Alamofire.HTTPMethod { get }
    var parameters: Alamofire.Parameters? { get }
    var encoding: Alamofire.ParameterEncoding { get }
}

extension EndPoint {
    var baseURL: URL {
        URL(string: (Bundle.main.infoDictionary?["BASE_URL"] as? String) ?? "")!
    }
    
    func asURL() throws -> URL {
        return baseURL.appending(path: path)
    }
}
