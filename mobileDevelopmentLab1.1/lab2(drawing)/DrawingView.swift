//
//  DrawingView.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliuchovych on 09.02.2021.
//

import UIKit

class DrawingView: UIView {

    var bezierPath = UIBezierPath()
    override func draw(_ rect: CGRect) {
        
            bezierPath.move(to: CGPoint(x: bounds.width/2, y: 0))
            bezierPath.addLine(to: CGPoint(x: bounds.width/2, y: bounds.height))
            
            bezierPath.move(to: CGPoint(x: 0, y: bounds.height/2))
            bezierPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height/2))
            
            bezierPath.move(to: CGPoint(x: bounds.width/2, y: 0))
            bezierPath.addLine(to: CGPoint(x: bounds.width/2 - 10, y: 20))
            
            bezierPath.move(to: CGPoint(x: bounds.width/2, y: 0))
            bezierPath.addLine(to: CGPoint(x: bounds.width/2 + 10, y: 20))
            
            bezierPath.move(to: CGPoint(x: bounds.width, y: bounds.height/2))
            bezierPath.addLine(to: CGPoint(x: bounds.width - 10, y: bounds.height/2 + 10))
            
            bezierPath.move(to: CGPoint(x: bounds.width, y: bounds.height/2))
            bezierPath.addLine(to: CGPoint(x: bounds.width - 10, y:bounds.height/2 - 10))
            
            bezierPath.lineWidth = 1
            UIColor.black.set()
            bezierPath.stroke()
            bezierPath.fill()
            
            let singleSegment = bounds.width/6
            for i in 0...7 {
                let ovalPath = UIBezierPath(ovalIn: CGRect(x: CGFloat(i)*singleSegment, y: bounds.height/2, width: 5, height: 5))
                UIColor.gray.setFill()
                ovalPath.fill()
            }
            for i in 0...3 {
                let ovalPath2 = UIBezierPath(ovalIn: CGRect(x: bounds.width/2, y: bounds.height/2 + CGFloat(i)*singleSegment, width: 3, height: 3))
                let ovalPath3 = UIBezierPath(ovalIn: CGRect(x: bounds.width/2, y: bounds.height/2 - CGFloat(i)*singleSegment, width: 3, height: 3))
                UIColor.gray.setFill()
                ovalPath2.fill()
                ovalPath3.fill()
            }
            
            let x0 = bounds.width/2
            let y0 = bounds.height/2
            let gr = UIBezierPath()
            gr.move(to: CGPoint(x: x0, y: y0))
            let kx1:[Double] = [1/4, 1/5, 1/6,
                               1/2, 1/3, 2/7,
                               1, 3/5, 4/5,
                               3, 1.2, 1.4]
            let kx2:[Double] = [-1/4, -1/5, -1/6,
                               -1/2, -1/3, -2/7,
                               -1, -3/5, -4/5,
                               -3, -1.2, -1.4]
            var ky1:[Double] = []
            var ky2:[Double] = []
            
            for i in kx1{
                ky1.append(i*i*i)
            }
            for i in kx2{
                ky2.append(i*i*i)
            }
            
            func onePartOfGr(kx:[Double], ky:[Double]) {
                    gr.addCurve(to: CGPoint(x: x0 + CGFloat(kx[0])*singleSegment, y: y0 - CGFloat(ky[0])*singleSegment),
                                controlPoint1: CGPoint(x: x0 + CGFloat(kx[1])*singleSegment, y: y0 - CGFloat(ky[1])*singleSegment),
                                controlPoint2: CGPoint(x: x0 + CGFloat(kx[2])*singleSegment , y: y0 - CGFloat(ky[2])*singleSegment))
                    gr.addCurve(to: CGPoint(x: x0 + CGFloat(kx[3])*singleSegment, y: y0 - CGFloat(ky[3])*singleSegment),
                                controlPoint1: CGPoint(x: x0 + CGFloat(kx[4])*singleSegment, y: y0 - CGFloat(ky[4])*singleSegment),
                                controlPoint2: CGPoint(x: x0 + CGFloat(kx[5])*singleSegment , y: y0 - CGFloat(ky[5])*singleSegment))
                    gr.addCurve(to: CGPoint(x: x0 + CGFloat(kx[6])*singleSegment, y: y0 - CGFloat(ky[6])*singleSegment),
                                controlPoint1: CGPoint(x: x0 + CGFloat(kx[7])*singleSegment, y: y0 - CGFloat(ky[7])*singleSegment),
                                controlPoint2: CGPoint(x: x0 + CGFloat(kx[8])*singleSegment , y: y0 - CGFloat(ky[8])*singleSegment))
                    gr.addCurve(to: CGPoint(x: x0 + CGFloat(kx[9])*singleSegment, y: y0 - CGFloat(ky[9])*singleSegment),
                                controlPoint1: CGPoint(x: x0 + CGFloat(kx[10])*singleSegment, y: y0 - CGFloat(ky[10])*singleSegment),
                                controlPoint2: CGPoint(x: x0 + CGFloat(kx[11])*singleSegment , y: y0 - CGFloat(ky[11])*singleSegment))
            }
            
            for i in 1...2{
                if i==1 {
                    onePartOfGr(kx: kx1, ky: ky1)
                }
                if i==2 {
                    gr.move(to: CGPoint(x: x0, y: y0))
                    onePartOfGr(kx: kx2, ky: ky2)
                }
            }
            gr.lineWidth = 1
            UIColor.red.set()
            gr.stroke()
    }


}
