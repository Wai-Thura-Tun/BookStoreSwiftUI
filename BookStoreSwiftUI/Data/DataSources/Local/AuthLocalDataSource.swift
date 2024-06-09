//
//  AuthLocalDataSource.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 06/06/2024.
//

import Foundation
import RealmSwift

class AuthLocalDataSource {
    static let shared : AuthLocalDataSource = .init()
    private let realm: Realm
    
    private init() {
        self.realm = try! Realm()
    }
    
    func saveUserInfo(for user: UserVO) throws {
        try realm.write {
            realm.add(user.toEntity(), update: .all)
        }
    }
    
    func getUserInfo() -> UserVO? {
        if let object = realm.object(ofType: UserEntity.self, forPrimaryKey: 1) {
            return object.toVO()
        }
        return nil
    }
    
    func deleteUserInfo() throws {
        if let object = realm.object(ofType: UserEntity.self, forPrimaryKey: 1) {
            try realm.write {
                realm.delete(object)
            }
        }
    }
}
