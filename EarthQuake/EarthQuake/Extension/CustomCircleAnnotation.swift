//
//  CustomCircleAnnotation.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 25/2/24.
//

import MapKit

final class CustomCircleAnnotation: MKAnnotationView {
    
    // MARK: Init
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.animate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
        self.animate()
    }
    
    // MARK: Draw
    private func setupLayout() {
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect)
        UIColor.red.setFill()
        circlePath.fill()
    }
    
    
    // MARK: Animation
    private func animate() {
        let duration: TimeInterval = 1.5
        let initialRadius: CGFloat = 10
        let finalRadius: CGFloat = 80
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        
        for i in 0..<4 {
            let circleLayer = CAShapeLayer()
            circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                            radius: initialRadius + CGFloat(i) * 10,
                                            startAngle: 0,
                                            endAngle: CGFloat.pi * 2,
                                            clockwise: true).cgPath
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.strokeColor = UIColor.red.withAlphaComponent(0.8).cgColor
            circleLayer.lineWidth = 2.0
            circleLayer.opacity = 1.0
            layer.addSublayer(circleLayer)
            circleLayer.add(animation, forKey: nil)
        }
    }
}
