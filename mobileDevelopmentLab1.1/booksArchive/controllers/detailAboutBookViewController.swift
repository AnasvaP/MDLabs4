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
    var networDetailedData: Detailed? = nil

    let dataFromLists = DataDetailedLists()
    static var selectedValue = String()
    let arVC = ArchiveTableViewController()

    override func viewDidLoad() {
        
        let network = Network()
        network.getDetailedData(forRequest: detailAboutBookViewController.selectedValue ) { (result) in
            switch result{
            case .success(let data):
                self.networDetailedData = data
                ArchiveTableViewController().tableView.reloadData()
                if self.arVC.searchBarIsEmpty(){
                    self.main(data: self.networDetailedData!)
                }
            case .failure(let error):
                print("error = ",error)
            }
        }
    }
    
    func main(data: Detailed){
        if data.isbn13 ==  detailAboutBookViewController.selectedValue {
            print("------ ", detailAboutBookViewController.selectedValue)
            self.titleOutlet.text = data.title
            self.subtitleOutlet.text = data.subtitle
            let urlString = data.image
            imageOfBookOutlet.imageFromUrl(urlString: urlString )
                self.authorsOutlet.text = data.authors
                self.publisherOutlet.text = data.publisher
                self.isbn13Outlet.text = data.isbn13
                self.pagesOutlet.text = data.pages
                self.yearOutlet.text = data.year
                self.ratingOutlet.text = data.rating
                self.descriptionOutlet.text = data.desc
                self.priceOutlet.text = data.price
            }
        }
    
}

