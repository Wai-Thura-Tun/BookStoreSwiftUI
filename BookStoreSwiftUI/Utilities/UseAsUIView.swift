//
//  UseAsUIView.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import Foundation
import SwiftUI

protocol SwiftUIViewConvertible {
    static func asUIView()
}

extension SwiftUIViewConvertible where Self: View {
    static func asUIView() {
        let hostingController = UIHostingController(rootView: self)
    }
}
