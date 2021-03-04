//
//  currentData2.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 03.03.2021.
//

import Foundation

struct currentData2 {
  
    var title = String()
    var subtitle = String()
    var authors = String()
    var publisher = String()
    var isbn13 = String()
    var price = String()
    var image = String()
    var pages = String()
    var year = String()
    var rating = String()
    var desc = String()

init?(model2: NewGithub) {
    self.authors = model2.authors
    self.publisher = model2.publisher
    self.pages = model2.pages
    self.year = model2.year
    self.rating = model2.rating
    self.desc = model2.desc
    self.title = model2.title
    self.subtitle = model2.subtitle
    self.price = model2.price
    self.image = model2.image
    self.isbn13 = model2.isbn13
    }
}
