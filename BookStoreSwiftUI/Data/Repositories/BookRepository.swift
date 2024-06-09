//
//  BookRepository.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 09/06/2024.
//

import Foundation

class BookRepository {
    private let bookRemoteDataSource: BookRemoteDataSource = .init()
    
    func getBooks(
        onSuccess: @escaping ([HomeData]) -> (),
        onFailed: @escaping (String) -> ()
    )
    {
        bookRemoteDataSource.getBooks(onSuccess: onSuccess, onFailed: onFailed)
    }
}
