//
//  CustomActivityIndicator.swift
//  Test
//
//  Created by admin on 28/2/2025.
//

import UIKit


class CustomActivityIndicator: UIView {
    
    private let circleLayer = CAShapeLayer()
    private let animationDuration: CFTimeInterval = 1.5
    
    private let lightBlue = UIColor.light.cgColor
    private let darkBlue = UIColor.dark.cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    private func setup() {
        let radius = min(bounds.width, bounds.height) / 2 - 10
        let rect = CGRect(x: bounds.midX - radius, y: bounds.midY - radius, width: radius * 2, height: radius * 2)
        let path = UIBezierPath(ovalIn: rect)
        
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = lightBlue
        circleLayer.lineWidth = 5
        circleLayer.strokeEnd = 0
        circleLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        layer.addSublayer(circleLayer)
    }
    
    // MARK: - Animation
    
    func startAnimating() {
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        strokeEndAnimation.duration = animationDuration
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        strokeEndAnimation.fillMode = .forwards
        strokeEndAnimation.isRemovedOnCompletion = false
        strokeEndAnimation.repeatCount = .infinity
        
        circleLayer.add(strokeEndAnimation, forKey: "loading")
        
        let colorAnimation = CABasicAnimation(keyPath: "strokeColor")
        colorAnimation.fromValue = lightBlue
        colorAnimation.toValue = darkBlue
        colorAnimation.duration = animationDuration
        colorAnimation.autoreverses = true
        colorAnimation.repeatCount = .infinity
        
        circleLayer.add(colorAnimation, forKey: "colorChange")
    }
    
    func stopAnimating() {
        circleLayer.removeAllAnimations()
    }
    
}

