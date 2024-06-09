//
//  SignUpVM.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 05/06/2024.
//

import Foundation

protocol SignUpViewDelegate: AnyObject {
    func onSuccesSignUp()
    func onError(error: String)
    func onAlreadyUser()
}

class SignUpVM: ObservableObject {
    
    private let repository: AuthRepository = .init()
    
    private weak var delegate: SignUpViewDelegate?
    
    init(delegate: SignUpViewDelegate?) {
        self.delegate = delegate
    }
    
    private(set) var userName: String? = nil {
        didSet {
            validate()
        }
    }
    
    private(set) var email: String? = nil {
        didSet {
            validate()
        }
    }
    
    private(set) var phone: String? = nil {
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
    
    @Published var emailValue: String = "" {
        didSet {
            self.email = emailValue
        }
    }
    @Published var phoneValue: String = "" {
        didSet {
            self.phone = phoneValue
        }
    }
    
    @Published var passwordValue: String = "" {
        didSet {
            self.password = passwordValue
        }
    }
    
    @Published var isSignUpBtnDisabled: Bool = true
    @Published var userNameError: String = ""
    @Published var emailError: String = ""
    @Published var phoneError: String = ""
    @Published var passwordError: String = ""
    
    private func validate() {
        userNameError = userName == nil || userName == "" ? "Username is required." : ""
        emailError = email == nil || email == "" ? "Email is required." : ""
        phoneError = phone == nil || phone == "" ? "Phone number is required." : ""
        passwordError = password == nil || password == "" ? "Passwordd is required." : ""
    }
    
    func signUp() {
        repository.signUp(
            username: userName!,
            email: email!,
            phone: phone!,
            password: password!)
        { [weak self] in
            self?.delegate?.onSuccesSignUp()
        } onFailed: { [weak self] error in
            switch error {
            case .ALREADY_EXIST_ERROR:
                self?.delegate?.onAlreadyUser()
            case .UNKNOWN(let error):
                self?.delegate?.onError(error: error)
            default:
                break
            }
        }

    }
    
    func goToLogin() {
        self.delegate?.onAlreadyUser()
    }
}
