//
//  AddNewBookVCViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 04.03.2021.
//

import UIKit

class AddNewBookVC: UIViewController {
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var subtitleTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    static var title: String = ""
    static var subtitle: String = ""
    static var price: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
    }
    
    @IBAction func addNewBook(_ sender: Any) {
        AddNewBookVC.title = titleTF.text ?? "no value entered"
        AddNewBookVC.subtitle = subtitleTF.text ?? "no value entered"
        AddNewBookVC.price = priceTF.text ?? "no value entered"
        warningLabel.isHidden = false
        warningLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        warningLabel.text = "і не забудь натиснути '+' 😉 "
    }
    
}
