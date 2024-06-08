//
//  UserEntity.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 06/06/2024.
//

import Foundation
import RealmSwift

class UserEntity: Object {
    @Persisted(primaryKey: true) var _id: Int = 1
    @Persisted var userName: String = ""
    @Persisted var email: String = ""
    @Persisted var phone: String = ""
    
    convenience init(userName: String, email: String, phone: String) {
        self.init()
        self.userName = userName
        self.email = email
        self.phone = phone
    }
}
