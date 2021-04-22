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


// MARK: - Photos
struct Photos: Codable {
    let total, totalHits: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let id: Int
    let pageURL: String
    let type: TypeEnum
    let tags: String
    let previewURL: String
    let previewWidth, previewHeight: Int
    let webformatURL: String
    let webformatWidth, webformatHeight: Int
    let largeImageURL: String
    let imageWidth, imageHeight, imageSize, views: Int
    let downloads, favorites, likes, comments: Int
    let userID: Int
    let user: String
    let userImageURL: String

    enum CodingKeys: String, CodingKey {
        case id, pageURL, type, tags, previewURL, previewWidth, previewHeight, webformatURL, webformatWidth, webformatHeight, largeImageURL, imageWidth, imageHeight, imageSize, views, downloads, favorites, likes, comments
        case userID = "user_id"
        case user, userImageURL
    }
}

enum TypeEnum: String, Codable {
    case photo = "photo"
}
