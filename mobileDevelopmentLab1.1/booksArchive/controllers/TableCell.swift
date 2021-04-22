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
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var subtitleOutlet: UILabel!
    @IBOutlet weak var titleNameOutlet: UILabel!
    @IBOutlet  var imageOutlet: UIImageView!
    
    
    func set2(data: [[String?]], index: Int){
        indicator.startAnimating()
        self.titleNameOutlet.text =  data[0][index]
        let urlString = data[4][index]
        imageOutlet.imageFromUrl(urlString: urlString ?? "")
        if data[1][index] == "" { self.subtitleOutlet.text = "no subtitle"}
            else{ self.subtitleOutlet.text = data[1][index] }
        self.priceOutlet.text = data[3][index]
        self.isbn13Outlet.text = data[2][index]
        self.indicator.stopAnimating()
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
