//
//  DrawView.swift
//  Homework16TMS_Khadatovich
//
//  Created by Yury Khadatovich on 8.11.21.
//

import UIKit

class DrawView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let layerWidth = layer.frame.width
        let layerHeight = layer.frame.height
        
        //Ship's base
        let base = UIBezierPath()
        
        base.move(to: CGPoint(x: 50, y: 200))  // начальная точка
        base.addLine(to: CGPoint(x: 0, y: 150))
        base.addLine(to: CGPoint(x: layerWidth, y: 150))
        base.addLine(to: CGPoint(x: (layerWidth - 50), y: 200))
        base.close()
        
        UIColor.black.setStroke()
        UIColor.red.setFill()
        //        base.stroke()
        base.fill()
        
        //Ship's cabin
        let cabin = UIBezierPath()
        
        cabin.move(to: CGPoint(x: layerWidth / 4, y: 150))
        cabin.addLine(to: CGPoint(x: layerWidth / 4, y: 100))
        cabin.addLine(to: CGPoint(x: layerWidth - (layerWidth / 4) , y: 100))
        cabin.addLine(to: CGPoint(x: layerWidth - (layerWidth / 4), y: 150))
        cabin.close()
        
        UIColor.black.setStroke()
        UIColor.cyan.setFill()
        //        cabin.stroke()
        cabin.fill()
        
        
        //Pipes
        let pipe = UIBezierPath()
        
        pipe.move(to: CGPoint(x: layerWidth / 3, y: 100))
        pipe.addLine(to: CGPoint(x: layerWidth / 3, y: 50))
        pipe.addLine(to: CGPoint(x: (layerWidth / 3) + 50, y: 50))
        pipe.addLine(to: CGPoint(x: (layerWidth / 3) + 50, y: 100))
        pipe.close()
        
        pipe.move(to: CGPoint(x: layerWidth - (layerWidth / 3), y: 100))
        pipe.addLine(to: CGPoint(x: layerWidth - (layerWidth / 3), y: 50))
        pipe.addLine(to: CGPoint(x: (layerWidth - (layerWidth / 3)) - 50, y: 50))
        pipe.addLine(to: CGPoint(x: (layerWidth - (layerWidth / 3)) - 50, y: 100))
        pipe.close()
        
        UIColor.purple.setFill()
        pipe.fill()
        
        //Waves
        let wave = UIBezierPath()
        let quantity = 10
        let radius = Int(layerWidth) / (2 * quantity)
        
        var step = 1
        while step < quantity {
            wave.move(to: CGPoint(x: step * (radius * 2) - radius, y: 200))
            wave.addArc(withCenter: CGPoint(x: step * (radius * 2), y: 200), radius: CGFloat(radius), startAngle: CGFloat(0.0), endAngle: CGFloat(180.0), clockwise: true)
            UIColor.blue.setFill()
            wave.close()
            wave.fill()
            step += 1
        }
    }
}
