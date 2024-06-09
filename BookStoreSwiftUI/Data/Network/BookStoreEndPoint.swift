//
//  BookStoreEndPoint.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 05/06/2024.
//

import Foundation
import Alamofire

enum BookStoreEndPoint: EndPoint {
    
    case Login(Encodable)
    case SignUp(Encodable)
    case BookLists
    
    var path: String {
        switch self {
        case .Login:
            "/auth/login"
        case .SignUp:
            "/auth/register_user"
        case .BookLists:
            "/user/books"
        }
    }
    
    var header: Alamofire.HTTPHeaders? {
        switch self {
        case .Login, .SignUp, .BookLists:
            nil
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .Login, .SignUp:
                .post
        case .BookLists:
                .get
        }
    }
    
    var parameters: Alamofire.Parameters? {
        switch self {
        case let .Login(request), let .SignUp(request):
            request.toDict()
        case .BookLists:
            nil
        }
    }
    
    var encoding: any Alamofire.ParameterEncoding {
        switch self {
        case .Login, .SignUp:
            JSONEncoding.default
        case .BookLists:
            URLEncoding.default
        }
    }
    
}

extension Encodable {
    func toDict() -> [String: Any] {
        do {
            let encodeData = try JSONEncoder().encode(self)
            let dictData = try JSONSerialization.jsonObject(with: encodeData, options: .fragmentsAllowed) as? [String: Any]
            return dictData ?? [:]
        }
        catch {
            return [:]
        }
    }
}
