//
//  BookListResponse.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 08/06/2024.
//

import Foundation

class HomeData: Identifiable {
}

struct BookListResponse: Codable {
    let code: Int
    let message: String
    let data: BookDataVO?
    
    enum CodingKeys: String, CodingKey {
        case code, message, data
    }
}

struct BookDataVO: Codable {
    let specialBooks: [SpecialBookVO]
    let normalBooks: [BookVO]
    
    enum CodingKeys: String, CodingKey {
        case specialBooks = "special_books"
        case normalBooks = "normal_books"
    }
}

class BookVO: HomeData, Codable {
    let id: String?
    let name: String?
    let description: String?
    let bookCover: String?
    let author: Author?
    let category: Category?
    let rating: Double?
    let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, author, category, rating, price
        case bookCover = "book_cover"
    }
}

class SpecialBookVO: HomeData, Codable {
    let title: String?
    let type: String?
    let books: [BookVO]
    
    enum CodingKeys: String, CodingKey {
        case title, type, books
    }
}

struct Author: Codable {
    let id: String?
    let name: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
    }
}

struct Category: Codable {
    let id: String?
    let categoryName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryName = "category_name"
    }
}
