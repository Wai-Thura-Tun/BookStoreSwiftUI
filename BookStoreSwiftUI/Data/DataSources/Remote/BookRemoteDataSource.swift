//
//  BookRemoteDataSource.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 09/06/2024.
//

import Foundation

class BookRemoteDataSource {
    private let network: NetworkManager = .shared
    
    func getBooks(
        onSuccess: @escaping ([HomeData]) -> (),
        onFailed: @escaping (String) -> ()
    )
    {
        network.request(endPoint: .BookLists) { (response: BookListResponse) in
            let specialBooks: [HomeData] = response.data?.specialBooks ?? []
            let normalBooks: [HomeData] = response.data?.normalBooks ?? []
            let homeData: [HomeData] = specialBooks + normalBooks
            onSuccess(homeData)
        } onFailure: { error in
            onFailed(error.customMessage)
        }

    }
}
