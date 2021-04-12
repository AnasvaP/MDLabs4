//
//  TableViewCell.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 09.03.2021.
//

import UIKit
import Alamofire
import AlamofireImage

class TableCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var isbn13Outlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var subtitleOutlet: UILabel!
    @IBOutlet weak var titleNameOutlet: UILabel!
    @IBOutlet  var imageOutlet: UIImageView!
    
    func set(data: [[String?]], index: Int){
        
        self.titleNameOutlet.text =  data[0][index]
        if data[4][index] == "" {
            self.imageOutlet.image = UIImage(named: "defaultImage")
        } else {
            self.imageOutlet.image = UIImage(named: data[4][index] ?? "defaultImage")
        }
        if data[1][index] == "" { self.subtitleOutlet.text = "no subtitle"}
            else{ self.subtitleOutlet.text = data[1][index] }
        self.priceOutlet.text = data[3][index]
        self.isbn13Outlet.text = data[2][index]
    }
    
    func set2(data: [[String?]], index: Int){
        DispatchQueue.main.async {
            self.indicator.isHidden = false
            self.indicator.startAnimating()
        }
        self.titleNameOutlet.text =  data[0][index]
        let urlString = data[4][index]
        imageOutlet.imageFromUrl(urlString: urlString ?? "")
        if data[1][index] == "" { self.subtitleOutlet.text = "no subtitle"}
            else{ self.subtitleOutlet.text = data[1][index] }
        self.priceOutlet.text = data[3][index]
        self.isbn13Outlet.text = data[2][index]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.indicator.stopAnimating()
        }
    }
    
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(url: url as URL)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {
                (response: URLResponse!, data: Data!, error: Error!) -> Void in
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
