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
    
    let archiveVC = ArchiveTableViewController()
    var parseBooksJSON = ParseBooksListJSON()
    let parseJSON = ParseDetailedJSON()
    var selectedValue = String()

    override func viewDidLoad() {
        main()
    }
    
    func main(){
            self.parseJSON.onCompletion = { currentData2 in
                if currentData2.title ==  self.selectedValue {
                    self.titleOutlet.text = currentData2.title
                    self.subtitleOutlet.text = currentData2.subtitle
                    
                    if currentData2.image == "" { self.imageOfBookOutlet.image = UIImage(named: "defaultImage") }
                    else{  self.imageOfBookOutlet.image = UIImage(named: currentData2.image)
                    }
                    self.authorsOutlet.text = currentData2.authors
                    self.publisherOutlet.text = currentData2.publisher
                    self.isbn13Outlet.text = currentData2.isbn13
                    self.pagesOutlet.text = currentData2.pages
                    self.yearOutlet.text = currentData2.year
                    self.ratingOutlet.text = currentData2.rating
                    self.descriptionOutlet.text = currentData2.desc
                    self.priceOutlet.text = currentData2.price
                }
           }
            for i in 1..<self.archiveVC.booksId.count{
                self.parseJSON.getData(forResource2: self.archiveVC.booksId[i])
        }
    }
    

}
