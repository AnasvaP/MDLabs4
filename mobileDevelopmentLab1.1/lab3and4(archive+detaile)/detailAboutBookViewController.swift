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
    
    let booksId: [String] = ["9780321856715","9780321862969","9781118841471","9781430236054","9781430237105","9781430238072","9781430245124","9781430260226","9781449308360","9781449342753" ]
    var countOfBooks = Int()
    let parseJSON = ParseJSON()

    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON.onCompletion = {currentData in
            self.countOfBooks = currentData.title.count
       }
        parseJSON.getData(forResource: "BooksList")
        
        for i in 1..<countOfBooks{
            parseJSON.onCompletion = {currentData in
                self.titleOutlet.text = currentData.detaileTitle
           }
            parseJSON.getData(forResource: booksId[i])
        }
    }
    
    
}
