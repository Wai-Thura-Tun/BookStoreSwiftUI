//
//  LoginVM.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import Foundation
import SwiftUI

protocol LoginViewDelegate: AnyObject {
    func onSuccessLogin()
    func onError(error: String)
    func onNewUser()
}

class LoginVM: ObservableObject {
    private let repository: AuthRepository = .init()
    private weak var delegate: LoginViewDelegate?
    
    init(delegate: LoginViewDelegate? = nil) {
        self.delegate = delegate
    }
    
    private(set) var userName: String? = nil {
        didSet {
            validate()
        }
    }
    
    private(set) var password: String? = nil {
        didSet {
            validate()
        }
    }
    
    @Published var userNameValue: String = "" {
        didSet {
            self.userName = userNameValue
        }
    }
    
    @Published var passwordValue: String = "" {
        didSet {
            self.password = passwordValue
        }
    }
    
    @Published var isLoginBtnDisabled: Bool = true
    @Published var usernameError: String = ""
    @Published var passwordError: String = ""
    
    private func validate() {
        usernameError = userName == nil || userName == "" ? "Username is required" : ""
        passwordError = password == nil || password == "" ? "Password is required" : ""
        isLoginBtnDisabled = !usernameError.isEmpty || !passwordError.isEmpty
    }
    
    func login() {
        repository.login(
            username: userName!,
            password: password!)
        { [weak self] in
            self?.delegate?.onSuccessLogin()
        } onFailed: { [weak self] error in
            switch error {
            case .NEW_USER_ERROR:
                self?.delegate?.onNewUser()
            case .UNKNOWN(let error):
                self?.delegate?.onError(error: error)
            default:
                break
            }
        }
    }
    
    func goToSignUp() {
        self.delegate?.onNewUser()
    }
}
