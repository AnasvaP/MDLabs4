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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addNewBook(_ sender: Any) {
        print("add new cell")
        let arVC = ArchiveTableViewController()
        arVC.addMethod()
    }    
}
