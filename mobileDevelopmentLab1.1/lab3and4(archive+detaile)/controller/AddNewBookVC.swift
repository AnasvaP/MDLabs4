//
//  AddNewBookVCViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 04.03.2021.
//

import UIKit

class AddNewBookVC: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var subtitleTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    static var title: String = ""
    static var subtitle: String = ""
    static var price: String = ""
    let arVC = ArchiveTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addNewBook(_ sender: Any) {
        AddNewBookVC.title = titleTF.text ?? "no value entered"
        AddNewBookVC.subtitle = subtitleTF.text ?? "no value entered"
        AddNewBookVC.price = priceTF.text ?? "no value entered"
        //arVC.insertRow()
    }
    
}
