//
//  drawingVC.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliuchovych on 09.02.2021.
//

import UIKit

class DrawingViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var viewForDraw: UIView!
    @IBOutlet weak var viewForArc: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func indexControl(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                viewForArc.isHidden = true
                viewForDraw.isHidden = false
            case 1:
                viewForArc.isHidden = false
                viewForDraw.isHidden = true
            default:
                break
        }
    }
}
