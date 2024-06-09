//
//  UserDefaultManager.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import Foundation

extension UserDefaults {
    static let OLD_USER_KEY: String = "OLD_USER"
    
    static func setOldUser() {
        standard.set(true, forKey: OLD_USER_KEY)
    }
    
    static func getOldUser() -> Bool {
        standard.bool(forKey: OLD_USER_KEY)
    }
}
