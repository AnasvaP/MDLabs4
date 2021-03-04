//
//  model.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import Foundation

// MARK: - Github
struct Github: Codable {
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let title, subtitle, isbn13, price: String
    let image: String
}


// MARK: - Github new
struct NewGithub: Codable {
    let title, subtitle, authors, publisher: String
    let isbn13, pages, year, rating: String
    let desc, price, image: String
}
