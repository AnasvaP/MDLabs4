//
//  TableViewCell.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 09.03.2021.
//

import UIKit

class TableCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet weak var isbn13Outlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var subtitleOutlet: UILabel!
    @IBOutlet weak var titleNameOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    func set(data: [[String]], index: Int){
        self.titleNameOutlet.text =  data[0][index]
        if data[4][index] == "" {
            self.imageOutlet.image = UIImage(named: "defaultImage")
        } else {
            self.imageOutlet.image = UIImage(named: data[4][index])
        }
        if data[1][index] == "" { self.subtitleOutlet.text = "no subtitle"}
            else{ self.subtitleOutlet.text = data[1][index] }
        self.priceOutlet.text = data[3][index]
        self.isbn13Outlet.text = data[2][index]
    }
}
