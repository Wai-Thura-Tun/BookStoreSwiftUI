//
//  AuthRepository.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 06/06/2024.
//

import Foundation

class AuthRepository {
    private let authRemoteDS: AuthRemoteDataSource = .init()
    private let authLocalDS: AuthLocalDataSource = .shared
    
    func login(username: String,
               password: String,
               onSuccess: @escaping () -> (),
               onFailed: @escaping (AuthDataError) -> ()
    )
    {
        authRemoteDS.login(
            username: username,
            password: password,
            onSuccess: { [weak self] token, user in
                do {
                    try self?.authLocalDS.saveUserInfo(for: user)
                    onSuccess()
                }
                catch {
                    onFailed(.UNKNOWN("Something went wrong"))
                }
                KeychainManager.shared.saveToken(for: token)
            }, onFailed: onFailed
        )
    }
    
    func signUp(username: String,
                email: String,
                phone: String,
                password: String,
                onSuccess: @escaping () -> (),
                onFailed: @escaping (AuthDataError) -> ()
    )
    {
        authRemoteDS.signUp(
            username: username,
            email: email,
            phone: phone,
            password: password,
            onSuccess: { [weak self] token, user in
                do {
                    try self?.authLocalDS.saveUserInfo(for: user)
                    onSuccess()
                }
                catch {
                    onFailed(.UNKNOWN("Something went wrong"))
                }
                KeychainManager.shared.saveToken(for: token)
            }, onFailed: onFailed
        )
    }
}
