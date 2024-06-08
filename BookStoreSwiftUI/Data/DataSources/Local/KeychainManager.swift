//
//  KeychainManager.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import Foundation
import KeychainAccess

class KeychainManager {
    static let shared: KeychainManager = .init()
    
    private let keychain: Keychain
    
    private let ACCESS_TOKEN_KEY: String = "ACCESS_TOKEN"
    
    private init() {
        self.keychain = Keychain(service: "com.bookstore.access-token")
    }
    
    func saveToken(for token: String) {
        keychain[ACCESS_TOKEN_KEY] = token
    }
    
    func getToken() -> String? {
        return keychain[ACCESS_TOKEN_KEY]
    }
    
    func removeToken() {
        keychain[ACCESS_TOKEN_KEY] = nil
    }
}
