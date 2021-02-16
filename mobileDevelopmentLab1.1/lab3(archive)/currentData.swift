//
//  currentData.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import Foundation

struct currentData {
    var title = [String]()
    var subtitle = [String]()
    var isbn13 = [String]()
    var price = [String]()
    var image = [String]()
    
    var detaileTitle = String()
    var detaileSubtitle = String()
    var detaileAuthor = String()
    var detailePublisher = String()
    var detaileIsbn13 = String()
    var detailePages = String()
    var detaileYear = String()
    var detaileRating = String()
    var detaileDesc = String()
    var detailePrice = String()
    var detaileImage = String()
    
    init?(model: Github, newModel: NewGithub) {
        for i in 0..<model.books.count {
            self.subtitle.append( model.books[i].subtitle )
            self.title.append( model.books[i].title )
            self.isbn13.append( model.books[i].isbn13 )
            self.price.append( model.books[i].price )
            self.image.append( model.books[i].image )
      }
        self.detaileTitle = newModel.title
        self.detaileSubtitle = newModel.subtitle
        self.detaileAuthor = newModel.authors
        self.detailePublisher = newModel.publisher
        self.detaileIsbn13 = newModel.isbn13
        self.detailePages = newModel.pages
        
        self.detaileYear = newModel.year
        self.detaileRating = newModel.rating
        self.detaileDesc = newModel.desc
        self.detailePrice = newModel.price
        self.detaileImage = newModel.image
    }
}
