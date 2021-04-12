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


class DataDetailedLists {
    
    let parseDetailedJSON = ParseDetailedJSON()
    
    func main() -> ([[String]]) {
        
        var allData: [[String]] = [[],[],[],[],[],[],[],[],[],[],[]]
        let archiveVC = ArchiveTableViewController()
        parseDetailedJSON.onCompletion = { currentData2 in
            allData[0].append(currentData2.title)
            allData[1].append(currentData2.subtitle)
            allData[2].append(currentData2.authors)
            allData[3].append(currentData2.publisher)
            allData[4].append(currentData2.isbn13)
            allData[5].append(currentData2.pages)
            allData[6].append(currentData2.year)
            allData[7].append(currentData2.rating)
            allData[8].append(currentData2.desc)
            allData[9].append(currentData2.price)
            allData[10].append(currentData2.image)
        }
        for i in 1..<archiveVC.booksId.count{
            self.parseDetailedJSON.getData(forResource2: archiveVC.booksId[i])
            }
        
        for i in 0..<allData[10].count{
            if allData[10][i] == "" {
                allData[10][i] = "defaultImage"
            }
        }
        return allData
    }
}
