//
//  BorderLabel.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class BorderLabel: UILabel {

    func makeCircleWithColor(color: UIColor){
        self.clipsToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth  = 3.0
        self.layer.cornerRadius = self.frame.size.width * 0.5
    }
    
    func makeAveragePercent(percent: Float){
        var progressCircle = CAShapeLayer()
        
        let circlePath = UIBezierPath(ovalIn: self.bounds)
        
        progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.cgPath
        progressCircle.strokeColor = UIColor.yellow.cgColor
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = 5.0
        
        self.layer.addSublayer(progressCircle)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = percent / 10.0
        animation.duration = 1
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        progressCircle.add(animation, forKey: "ani")
    }
}
