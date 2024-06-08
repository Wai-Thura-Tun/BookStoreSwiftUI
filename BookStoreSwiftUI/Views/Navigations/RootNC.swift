//
//  RootNC.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import UIKit

class RootNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        checkUserLoginStatus()
    }
    
    func checkUserLoginStatus() {
        if KeychainManager.shared.getToken() != nil {
            goToHome()
        }
        else {
            goToLogin()
        }
    }
    
    func goToLogin() {
        let vc = LoginVC.instantiate()
        setViewControllers([vc], animated: true)
    }
    
    func goToHome() {
        let vc =  BookListVC.instantiate()
        setViewControllers([vc], animated: true)
    }
}
