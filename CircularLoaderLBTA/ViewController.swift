//
//  ViewController.swift
//  CircularLoaderLBTA
//
//  Created by Maysam Shahsavari on 15/03/2019.
//  Copyright © 2019 Maysam Shahsavari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let calc = calculation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calc.delegate = self
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        trackLayer.position = view.center
        
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.position = view.center
        
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }

    fileprivate func animateCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        //basicAnimation.toValue = 1
        basicAnimation.duration = 0
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        calc.start_Calculation()
    }
    
}

extension ViewController: UpdateProgressDelegate {
    func update(progress: Float) {
        print("Percentage: \(progress)")
        self.shapeLayer.strokeEnd = CGFloat(progress)
 
    }
}















