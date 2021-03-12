//
//  ArchiveTableViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import UIKit

class ArchiveTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var label: UILabel!
    var parseBooksJSON = ParseBooksListJSON()
    var parseDetJSON = ParseDetailedJSON()
    var countOfBooks = Int()
    var search = UISearchController()
    var filteredData: [[String]] = [[],[],[],[],[]]
    var countOfFilteredBook: Int = 0
    
    let addNewBookVC = AddNewBookVC()
    let dataFromBL = DataFromBooksList()
    var data = [[String]]()
    let booksId: [String] = ["BooksList","9780321856715","9780321862969","9781118841471","9781430236054","9781430237105","9781430238072","9781430245124","9781430260226","9781449308360","9781449342753" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        data = dataFromBL.main()
        
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewBtn))
        self.navigationItem.rightBarButtonItem = addBtn
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    
    // MARK: - Additional func
    
    func addMethod() {
        data = dataFromBL.main()
        let index = data[0].count
        tableView.performBatchUpdates({
            self.data[0].insert("new",at: index)
            self.data[1].insert("new",at: index)
            self.data[2].insert("new",at: index)
            self.data[3].insert("new",at: index)
            self.data[4].insert("defaultImage",at: index)
            tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }, completion: { result in
            self.tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
        })
    }
    
    @objc func addNewBtn(){
        print("add")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewBookVC") as! AddNewBookVC
        self.navigationController?.pushViewController(vc, animated: true)
        addMethod()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? detailAboutBookViewController {
                let selectedRow = self.tableView.indexPathForSelectedRow!.row
                destination.selectedValue = data[0][selectedRow]
            }
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
        return data[0].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableCell
        var dataForCell = [[String]]()
        if isSearching() {
            dataForCell = filteredData
        } else {
            dataForCell = data
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
                    self.data[i].remove(at: indexPath.row)
                    }
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }, completion: nil )
        })
        swipe.image = #imageLiteral(resourceName: "leftSwipe@x3")
        swipe.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return UISwipeActionsConfiguration(actions: [swipe])
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
        for i in 0..<data[0].count{
            if  data[0][i].lowercased().contains(searchController.searchBar.text!.lowercased()){
                countOfFilteredBook += 1
                filteredData[0].append( data[0][i])
                filteredData[1].append( data[1][i])
                filteredData[2].append( data[2][i])
                filteredData[3].append( data[3][i])
                filteredData[4].append( data[4][i])
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
