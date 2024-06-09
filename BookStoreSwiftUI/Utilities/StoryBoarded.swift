//
//  StoryBoarded.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import Foundation
import UIKit

protocol StoryBoarded {
    static var storyboardName: String { get set }
    static func instantiate(bundle: Bundle) -> Self
}

extension StoryBoarded {
    static func instantiate(bundle: Bundle = Bundle.main) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewController(identifier: String(describing: Self.self)) as! Self
    }
}
