//
//  SignUpRequest.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 06/06/2024.
//

import Foundation

struct SignUpRequest: Encodable {
    let userName: String?
    let email: String?
    let phoneNumber: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case phoneNumber = "phone_number"
        case email, password
    }
}
