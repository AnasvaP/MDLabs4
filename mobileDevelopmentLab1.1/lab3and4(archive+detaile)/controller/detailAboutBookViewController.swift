//
//  detailAboutBookViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 16.02.2021.
//

import UIKit

class detailAboutBookViewController: UIViewController {
    
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var imageOfBookOutlet: UIImageView!
    @IBOutlet weak var subtitleOutlet: UILabel!
    @IBOutlet weak var authorsOutlet: UILabel!
    @IBOutlet weak var publisherOutlet: UILabel!
    @IBOutlet weak var isbn13Outlet: UILabel!
    @IBOutlet weak var pagesOutlet: UILabel!
    @IBOutlet weak var yearOutlet: UILabel!
    @IBOutlet weak var ratingOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    var allData: [[String]] = [[],[],[],[],[],[],[],[],[],[],[]]

    
    let archiveVC = ArchiveTableViewController()
    var parseBooksJSON = ParseBooksListJSON()
    let parseJSON = ParseDetailedJSON()
    var selectedValue = String()

    override func viewDidLoad() {
        self.parseJSON.onCompletion = { currentData2 in
            self.allData[0].append(currentData2.title)
            self.allData[1].append(currentData2.subtitle)
            self.allData[2].append(currentData2.authors)
            self.allData[3].append(currentData2.publisher)
            self.allData[4].append(currentData2.isbn13)
            self.allData[5].append(currentData2.pages)
            self.allData[6].append(currentData2.year)
            self.allData[7].append(currentData2.rating)
            self.allData[8].append(currentData2.desc)
            self.allData[9].append(currentData2.price)
            self.allData[10].append(currentData2.image)
        }
        for i in 1..<self.archiveVC.booksId.count{
            self.parseJSON.getData(forResource2: self.archiveVC.booksId[i])
    }
        main()
    }
    
    func removeRow(index : Int){
        for i in 0..<allData[0].count{
            allData[i].remove(at: index)
            print(allData[i].remove(at: index))
        }
        main()
    }
    
    func main(){
        for i in 0..<allData[1].count{
            if allData[0][i] ==  self.selectedValue {
                print(allData[0][i], self.selectedValue)
                self.titleOutlet.text = allData[0][i]
                self.subtitleOutlet.text = allData[1][i]
                if allData[10][i] == "" { self.imageOfBookOutlet.image = UIImage(named: "defaultImage") }
                    else{  self.imageOfBookOutlet.image = UIImage(named: allData[10][i])
                }
                self.authorsOutlet.text = allData[2][i]
                self.publisherOutlet.text = allData[3][i]
                self.isbn13Outlet.text = allData[4][i]
                self.pagesOutlet.text = allData[5][i]
                self.yearOutlet.text = allData[6][i]
                self.ratingOutlet.text = allData[7][i]
                self.descriptionOutlet.text = allData[8][i]
                self.priceOutlet.text = allData[9][i]
            }
        }
    }
}
