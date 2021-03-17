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
    let dataFromLists = DataDetailedLists()
    var parseBooksJSON = ParseBooksListJSON()
    let parseJSON = ParseDetailedJSON()
    var selectedValue = String()

    override func viewDidLoad() {
        allData = dataFromLists.main()
        main()
    }
    
    func main(){
        for i in 0..<allData[1].count{
            if allData[0][i] ==  self.selectedValue {
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
