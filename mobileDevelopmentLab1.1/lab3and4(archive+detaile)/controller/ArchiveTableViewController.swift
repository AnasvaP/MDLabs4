//
//  ArchiveTableViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import UIKit

class ArchiveTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var label: UILabel!
    var search = UISearchController()
    var filteredData: [[String]] = [[],[],[],[],[]]
    var countOfFilteredBook: Int = 0
    var index = Int()
    let dataFromBL = DataFromBooksList()
    static var data: [[String]] = [[],[],[],[],[]]
    let booksId: [String] = ["BooksList","9780321856715","9780321862969","9781118841471","9781430236054","9781430237105","9781430238072","9781430245124","9781430260226","9781449308360","9781449342753" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "cell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        ArchiveTableViewController.data = dataFromBL.main()
        index = ArchiveTableViewController.data[0].count
        
    }
}
    
    
   
// MARK: - Table view data source

extension ArchiveTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching() {
            return countOfFilteredBook
        }
        return ArchiveTableViewController.data[0].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableCell
        var dataForCell = [[String]]()
        if isSearching() {
            dataForCell = filteredData
        } else {
            dataForCell = ArchiveTableViewController.data
        }
        cell.set(data: dataForCell, index: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipe = UIContextualAction(style: .normal, title: "delete", handler: {(action, view, success) in
            tableView.performBatchUpdates({
                for i in 0...4{
                    ArchiveTableViewController.data[i].remove(at: indexPath.row)
                    }
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }, completion: nil )
        })
        swipe.image = #imageLiteral(resourceName: "leftSwipe@x3")
        swipe.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return UISwipeActionsConfiguration(actions: [swipe])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailAboutBookViewController") as! detailAboutBookViewController
        self.navigationController?.pushViewController(vc, animated: true)
        let selectedRow = self.tableView.indexPathForSelectedRow!.row
        detailAboutBookViewController.selectedValue = ArchiveTableViewController.data[0][selectedRow]
    }
}


// MARK: - Search

extension ArchiveTableViewController : UISearchResultsUpdating {
    
    func searchBarIsEmpty() -> Bool {
        return search.searchBar.text?.isEmpty ?? true
    }
    
    func isSearching() -> Bool {
        return search.isActive && !searchBarIsEmpty()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredData = [[],[],[],[],[]]
        countOfFilteredBook = 0
        for i in 0..<ArchiveTableViewController.data[0].count{
            if  ArchiveTableViewController.data[0][i].lowercased().contains(searchController.searchBar.text!.lowercased()){
                countOfFilteredBook += 1
                for j in 0...4{
                    filteredData[j].append( ArchiveTableViewController.data[j][i])
                }
            }
        }
        if search.isActive && filteredData[0].count == 0 {
            label.text = "no result"
        } else if search.isActive && filteredData[0].count != 0 {
            label.text = "result of the searching"
        } else if !search.isActive{
            label.text = "your books archive"
        }
        tableView.reloadData()
    }
}
