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
    static var filteredData: [[String]] = [[],[],[],[],[]]
    var index = Int()
    let tc = TableCell()
    var isVisible: Bool = false
    var networkDataCount: Int = 0
    var enteredDataInSearchController = String()
    
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
        search.obscuresBackgroundDuringPresentation = false // to scroll table view while searching
        navigationItem.searchController?.searchBar.placeholder = "Search by title"
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(insertRow))
    }
    
    @objc func insertRow() {
        
        print("insert row")
//        let index = ArchiveTableViewController.data[0].count
//        self.tableView.performBatchUpdates({
//            ArchiveTableViewController.data[0].insert(AddNewBookVC.title ,at: index)
//            ArchiveTableViewController.data[1].insert(AddNewBookVC.subtitle ,at: index)
//            ArchiveTableViewController.data[3].insert("$"+AddNewBookVC.price,at: index)
//            ArchiveTableViewController.data[2].insert("no value",at: index)
//            ArchiveTableViewController.data[4].insert("defaultImage",at: index)
//            self.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
//        }, completion: { result in
//            self.tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .middle, animated: true)
//        })
    }
    
}
    
    
   
// MARK: - Table view data source

extension ArchiveTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching() {
            if ArchiveTableViewController.filteredData == [[],[],[],[],[]] {
                return 0
            }
            return networkDataCount
        }
        else  {
            return 0
        }
    }
    
    func returnEmptyTable() -> UITableViewCell{
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableCell
        
        let indicator = UIActivityIndicatorView( style: .medium)
        indicator.color = .black
        indicator.backgroundColor = .green
        indicator.hidesWhenStopped = true
        indicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        cell.clipsToBounds = true
        cell.contentView.addSubview(indicator)
        
        if isSearching(){
            indicator.startAnimating()
            if ArchiveTableViewController.filteredData == [[],[],[],[],[]]  {
                indicator.stopAnimating()
                return returnEmptyTable()
            }
            cell.set2(data: ArchiveTableViewController.filteredData, index: indexPath.row)
            indicator.stopAnimating()
            return cell
            }
        else{
            return returnEmptyTable()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    

    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let swipe = UIContextualAction(style: .normal, title: "delete", handler: {(action, view, success) in
//            tableView.performBatchUpdates({
//                for i in 0...4{
//                    ArchiveTableViewController.data[i].remove(at: indexPath.row)
//                    }
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }, completion: nil )
//        })
//        swipe.image = #imageLiteral(resourceName: "leftSwipe@x3")
//        swipe.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
//        return UISwipeActionsConfiguration(actions: [swipe])
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailAboutBookVC") as! DetailAboutBookVC
        self.navigationController?.pushViewController(vc, animated: true)
        let selectedRow = self.tableView.indexPathForSelectedRow!.row
        if !searchBarIsEmpty() {
            DetailAboutBookVC.selectedValue = ArchiveTableViewController.filteredData[2][selectedRow]}
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
        self.enteredDataInSearchController = searchController.searchBar.text!.lowercased()
        ArchiveTableViewController.filteredData = [[],[],[],[],[]]
        if enteredDataInSearchController.count > 2 {
            let network = Network()
            network.getData(forRequest: enteredDataInSearchController ) {[weak self] (result) in
                switch result{
                case .success(let data):
                    self?.networkDataCount = data.books.count
                    for i in 0..<data.books.count{
                        ArchiveTableViewController.filteredData[0].append(data.books[i].title )
                        ArchiveTableViewController.filteredData[1].append(data.books[i].subtitle )
                        ArchiveTableViewController.filteredData[2].append(data.books[i].isbn13 )
                        ArchiveTableViewController.filteredData[3].append(data.books[i].price )
                        ArchiveTableViewController.filteredData[4].append(data.books[i].image )
                        }
                    self?.tableView.reloadData()
                    DispatchQueue.main.async {
                    }
                case .failure(let error):
                    print("error = ",error)
                }
            }
        
        } else {
            ArchiveTableViewController.filteredData = [[],[],[],[],[]]
        }
    }
}
 
