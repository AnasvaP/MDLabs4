//
//  ArchiveTableViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import UIKit

class ArchiveTableViewController: UITableViewController {
    
    var parseBooksJSON = ParseBooksListJSON()
    var parseDetJSON = ParseDetailedJSON()
    var countOfBooks = Int()
    let booksId: [String] = ["BooksList","9780321856715","9780321862969","9781118841471","9781430236054","9781430237105","9781430238072","9781430245124","9781430260226","9781449308360","9781449342753" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = UITableView.automaticDimension
        parseBooksJSON.onCompletion = { currentData in
            self.countOfBooks = currentData.title.count
           }
        parseBooksJSON.getData(forResource: booksId[0])
        
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
        parseBooksJSON.onCompletion = {currentData in
            if currentData.title[indexPath.row] == "" { cell.titleNameOutlet.text = "-"}
            else{ cell.titleNameOutlet.text = currentData.title[indexPath.row] }

            if currentData.image[indexPath.row] == "" { cell.imageOutlet.image = UIImage(named: "defaultImage") }
            else{ cell.imageOutlet.image = UIImage(named: currentData.image[indexPath.row]) }

            if currentData.subtitle[indexPath.row] == "" { cell.subtitleOutlet.text = "no subtitle"}
            else{ cell.subtitleOutlet.text = currentData.subtitle[indexPath.row] }

            cell.priceOutlet.text = currentData.price[indexPath.row]
            cell.isbn13Outlet.text = currentData.isbn13[indexPath.row]
           }
        parseBooksJSON.getData(forResource: booksId[0])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.parseBooksJSON.onCompletion = { currentData in
            if let destination = segue.destination as? detailAboutBookViewController {
                let selectedRow = self.tableView.indexPathForSelectedRow!.row
                destination.selectedValue = currentData.title[selectedRow]
            }
           }
        self.parseBooksJSON.getData(forResource: booksId[0])
    }
}

class TableCell: UITableViewCell {
    
    @IBOutlet weak var isbn13Outlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var subtitleOutlet: UILabel!
    @IBOutlet weak var titleNameOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
}
