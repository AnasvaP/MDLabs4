//
//  model.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import Foundation

// MARK: - Github
struct Github: Codable {
    var books: [Book]
}

// MARK: - Book
struct Book: Codable {
    var title, subtitle, isbn13, price: String
    var image: String
}


// MARK: - Github new
struct NewGithub: Codable {
    var title, subtitle, authors, publisher: String
    var isbn13, pages, year, rating: String
    var desc, price, image: String
}
