//
//  BookListVC.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 07/06/2024.
//

import UIKit
import SwiftUI

class BookListVC: UIViewController, StoryBoarded {

    @IBOutlet weak var containerView: UIView!
    
    static var storyboardName: String = "Home"
    
    private lazy var vm: BookListVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showScreen()
    }

    private func showScreen() {
        let bookListScreen = BookListScreen(vm: self.vm)
        let hostingController = UIHostingController(rootView: bookListScreen)
        addChild(hostingController)
        hostingController.view.frame = containerView.frame
        containerView.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}

extension BookListVC: BookListViewDelegate {
    
}
