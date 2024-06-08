//
//  BookListVM.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 07/06/2024.
//

import Foundation

protocol BookListViewDelegate: AnyObject {
    
}

class BookListVM: ObservableObject {
    private(set) var search: String? = nil {
        didSet {
            
        }
    }
    
    private weak var delegate: BookListViewDelegate?
    
    init(delegate: BookListViewDelegate?) {
        self.delegate = delegate
    }
    
    @Published var searchString: String = ""
}
