//
//  LoginResponse.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 06/06/2024.
//

import Foundation

struct LoginResponse: Codable {
    let code: Int
    let message: String
    let data: LoginVO?
    
    enum CodingKeys: String, CodingKey {
        case code, message, data
    }
}

struct LoginVO: Codable {
    let userName: String?
    let phoneNumber: String?
    let email: String?
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case phoneNumber = "phone_number"
        case accessToken = "access_token"
        case email
    }
}

typealias SignUpResponse = LoginResponse

struct UserVO {
    let userName: String
    let email: String
    let phone: String
}
