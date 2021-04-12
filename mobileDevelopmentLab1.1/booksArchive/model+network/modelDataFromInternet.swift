//
//  modelDataFromInternet.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 03.04.2021.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let error, total, page: String
    let books: [Books]
}

// MARK: - Book
struct Books: Codable {
    let title, subtitle, isbn13, price: String
    let image: String
    let url: String
}

// MARK: - Detailed
struct Detailed: Codable {
    let error, title, subtitle, authors: String
    let publisher, language, isbn10, isbn13: String
    let pages, year, rating, desc: String
    let price: String
    let image: String
    let url: String
}
