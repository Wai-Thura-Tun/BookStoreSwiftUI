//
//  NetworkError.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 05/06/2024.
//

import Foundation

enum NetworkError: Error {
    
    case INVALID_URL
    case EMPTY_RESPONSE
    case DECODE_ERROR
    case UNKNOWN_ERROR
    case UNEXPECTED_STATUS_CODE(Int)
    
    var customMessage: String {
        switch self {
        case .INVALID_URL:
            return "Invalid Url"
        case .EMPTY_RESPONSE:
            return "Empty Response"
        case .DECODE_ERROR:
            return "Decode Error"
        case .UNKNOWN_ERROR:
            return "Something went wrnong"
        case .UNEXPECTED_STATUS_CODE:
            return "Invalid Status Code"
        }
    }
}
