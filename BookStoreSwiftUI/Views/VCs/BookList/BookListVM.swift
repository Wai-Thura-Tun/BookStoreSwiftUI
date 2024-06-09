//
//  BookListVM.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 07/06/2024.
//

import Foundation

enum CellType: String {
    case BANNER
    case CAROUSEL
    case GRID
}

protocol BookListViewDelegate: AnyObject {
    func onError(error: String)
}

class BookListVM: ObservableObject {
    private(set) var search: String? = nil {
        didSet {
            
        }
    }
    
    private let repository: BookRepository = .init()
    
    private weak var delegate: BookListViewDelegate?
    
    init(delegate: BookListViewDelegate?) {
        self.delegate = delegate
    }
    
    @Published var searchString: String = "" {
        didSet {
            self.search = searchString
        }
    }
    
    @Published var data: [HomeData] = []
    
    @Published var isLoading: Bool = true
    
    func getBooks() {
        repository.getBooks { [weak self] data in
            self?.isLoading = false
            self?.data = data
            print(self?.data)
        } onFailed: { [weak self] error in
            self?.isLoading = false
            self?.delegate?.onError(error: error)
        }
    }
}
