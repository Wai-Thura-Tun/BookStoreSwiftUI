//
//  AuthMapper.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 06/06/2024.
//

import Foundation

extension UserEntity {
    func toVO() -> UserVO {
        return UserVO.init(
            userName: self.userName,
            email: self.email,
            phone: self.phone
        )
    }
}

extension UserVO {
    func toEntity() -> UserEntity {
        return UserEntity(
            userName: self.userName,
            email: self.email,
            phone: self.phone
        )
    }
}
