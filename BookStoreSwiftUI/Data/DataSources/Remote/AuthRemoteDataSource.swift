//
//  AuthRemoteDataSource.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 06/06/2024.
//

import Foundation

enum AuthDataError: Error {
    case NEW_USER_ERROR
    case ALREADY_EXIST_ERROR
    case UNKNOWN(String)
}

class AuthRemoteDataSource {
    private let network: NetworkManager = .shared
    private let newUserErrorCode = 404
    private let alreadyUserErrorCode = 409
    
    func login(username: String, 
               password: String,
               onSuccess: @escaping (String, UserVO) -> (),
               onFailed: @escaping (AuthDataError) -> ())
    {
        network.request(endPoint: .Login(
            LoginRequest.init(userName: username,
                              password: password)
        )
        ) { (response: LoginResponse) in
            if response.code == 0, let data = response.data, let token = response.data?.accessToken, !token.isEmpty {
                let userVO = UserVO.init(
                    userName: data.userName ?? "",
                    email: data.email ?? "",
                    phone: data.phoneNumber ?? ""
                )
                onSuccess(token, userVO)
            }
            else {
                onFailed(.UNKNOWN("Something went wrong"))
            }
        } onFailure: { error in
            switch error {
            case .UNEXPECTED_STATUS_CODE(let code):
                if code == self.newUserErrorCode {
                    onFailed(.NEW_USER_ERROR)
                }
                else  {
                    onFailed(.UNKNOWN(error.customMessage))
                }
            default:
                onFailed(.UNKNOWN(error.customMessage))
            }
        }
    }
    
    func signUp(username: String,
                email: String,
                phone: String,
                password: String,
                onSuccess: @escaping (String, UserVO) -> (),
                onFailed: @escaping (AuthDataError) -> ()
    ) 
    {
        network.request(endPoint: .SignUp(
            SignUpRequest.init(userName: username,
                               email: email,
                               phoneNumber: phone,
                               password: password)
        )
        ) { (response: SignUpResponse) in
            if response.code == 201, let data = response.data, let token = data.accessToken, !token.isEmpty {
                let userVO = UserVO.init(
                    userName: data.userName ?? "",
                    email: data.email ?? "",
                    phone: data.phoneNumber ?? ""
                )
                onSuccess(token, userVO)
            }
            else {
                onFailed(.UNKNOWN("Something went wrong"))
            }
        } onFailure: { error in
            switch error {
            case .UNEXPECTED_STATUS_CODE(let code):
                if code == self.alreadyUserErrorCode {
                    onFailed(.ALREADY_EXIST_ERROR)
                }
                else {
                    onFailed(.UNKNOWN(error.customMessage))
                }
            default:
                onFailed(.UNKNOWN(error.customMessage))
            }
        }

    }
}
