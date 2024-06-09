//
//  SignUpVC.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 05/06/2024.
//

import UIKit
import SwiftUI

class SignUpVC: UIViewController, StoryBoarded {

    @IBOutlet weak var containerView: UIView!
    
    static var storyboardName: String = "Auth"
    
    private lazy var vm: SignUpVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showScreen()
    }

    private func showScreen() {
        let signUpScreen = SignUpScreen(vm: self.vm)
        let hostingController = UIHostingController(rootView: signUpScreen)
        addChild(hostingController)
        hostingController.view.frame = containerView.frame
        containerView.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}

extension SignUpVC: SignUpViewDelegate {
    func onSuccesSignUp() {
        
    }
    
    func onError(error: String) {
        
    }
    
    func onAlreadyUser() {
        self.navigationController?.popViewController(animated: true)
    }
}
