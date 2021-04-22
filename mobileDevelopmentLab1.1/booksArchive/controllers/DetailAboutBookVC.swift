//
//  detailAboutBookViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 16.02.2021.
//

import UIKit

class DetailAboutBookVC: UIViewController {
    
    
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
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    
    var networDetailedData: Detailed? = nil
    static var selectedValue = String()
    let arVC = ArchiveTableViewController()

    override func viewDidLoad() {
        
        let network = Network()
        network.getDetailedData(forRequest: DetailAboutBookVC.selectedValue ) { (result) in
            switch result{
            case .success(let data):
                self.networDetailedData = data
                self.indicatorActivity.startAnimating()
                ArchiveTableViewController().tableView.reloadData()
                if self.arVC.searchBarIsEmpty(){
                    self.main(data: self.networDetailedData!)
                    DispatchQueue.main.async {
                        self.indicatorActivity.stopAnimating()
                    }
                }
            case .failure(let error):
                print("error = ",error)
            }
        }
    }
    
    func main(data: Detailed){
        if data.isbn13 ==  DetailAboutBookVC.selectedValue {
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

