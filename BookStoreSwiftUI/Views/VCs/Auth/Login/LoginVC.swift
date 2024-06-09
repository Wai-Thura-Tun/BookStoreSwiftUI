//
//  LoginVC.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import UIKit
import SwiftUI

class LoginVC: UIViewController, StoryBoarded {
    
    @IBOutlet weak var containerView: UIView!
    
    static var storyboardName: String = "Auth"
    
    private lazy var vm: LoginVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showScreen()
    }

    private func showScreen() {
        let loginScreen = LoginScreen(vm: self.vm)
        let hostingController = UIHostingController(rootView: loginScreen)
        addChild(hostingController)
        hostingController.view.frame = containerView.frame
        containerView.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}

extension LoginVC: LoginViewDelegate {
    
    func onSuccessLogin() {
        let vc = BookListVC.instantiate()
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    func onError(error: String) {
        print(error)
    }
    
    func onNewUser() {
        let vc = SignUpVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
