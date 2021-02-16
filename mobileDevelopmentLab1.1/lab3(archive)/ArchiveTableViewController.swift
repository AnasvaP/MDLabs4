//
//  ArchiveTableViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import UIKit

class ArchiveTableViewController: UITableViewController {
    
    var parseJSON = ParseJSON()
    var countOfBooks = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = UITableView.automaticDimension
        
        parseJSON.onCompletion = { currentData in
            self.countOfBooks = currentData.title.count
           }
        parseJSON.getData(forResource: "BooksList")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return countOfBooks
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableCell
        parseJSON.onCompletion = {currentData in
            if currentData.title[indexPath.row] == "" { cell.titleNameOutlet.text = "-"}
            else{ cell.titleNameOutlet.text = currentData.title[indexPath.row] }
            
            if currentData.image[indexPath.row] == "" { cell.imageOutlet.image = UIImage(named: "defaultImage") }
            else{ cell.imageOutlet.image = UIImage(named: currentData.image[indexPath.row]) }
            
            if currentData.subtitle[indexPath.row] == "" { cell.subtitleOutlet.text = "no subtitle"}
            else{ cell.subtitleOutlet.text = currentData.subtitle[indexPath.row] }

            cell.priceOutlet.text = currentData.price[indexPath.row]
            cell.isbn13Outlet.text = currentData.isbn13[indexPath.row]
           }
        parseJSON.getData(forResource: "BooksList")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
}

class TableCell: UITableViewCell {
    
    @IBOutlet weak var isbn13Outlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var subtitleOutlet: UILabel!
    @IBOutlet weak var titleNameOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
}
