//
//  DrawingArcVC.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliuchovych on 12.02.2021.
//

import UIKit

class DrawingArcView: UIView {

    func drawPart(forPart path: UIBezierPath, centerX x0: CGFloat, centerY y0: CGFloat, radians1 r1: CGFloat, radians2 r2: CGFloat, forColor color: UIColor) {
        path.addArc(withCenter: CGPoint(x: x0, y: y0),
                          radius: CGFloat(70),
                          startAngle: CGFloat(r1),
                          endAngle: CGFloat(r2),
                          clockwise: true)
        color.set()
        path.lineWidth = 70
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        let x0 = bounds.width/2
        let y0 = bounds.height/2
        let partRed = UIBezierPath()
        let partYellow = UIBezierPath()
        let partBrown = UIBezierPath()
        let partGray = UIBezierPath()
        let partViolet = UIBezierPath()
        let radiansArray: [CGFloat] = [0, 0.628319, 0.628319 + 0.942478, 0.628319 + 0.942478 + 1.5708, 0.628319 + 0.942478 + 1.5708 + 2.8274 , 0.628319 + 0.942478 + 1.5708 + 2.8274 + 0.314159 ]
        
        drawPart(forPart: partRed, centerX: x0, centerY: y0, radians1: radiansArray[0], radians2: radiansArray[1], forColor: UIColor.red)
        drawPart(forPart: partYellow, centerX: x0, centerY: y0, radians1: radiansArray[1], radians2: radiansArray[2], forColor: UIColor.yellow)
        drawPart(forPart: partBrown, centerX: x0, centerY: y0, radians1: radiansArray[2], radians2: radiansArray[3], forColor: UIColor.brown)
        drawPart(forPart: partGray, centerX: x0, centerY: y0, radians1: radiansArray[3], radians2: radiansArray[4], forColor: UIColor.gray)
        drawPart(forPart: partViolet, centerX: x0, centerY: y0, radians1:radiansArray[4], radians2: radiansArray[5], forColor: UIColor(displayP3Red: 0.7, green: 0.0, blue: 1.0, alpha: 1.0) )
        
    }
}
