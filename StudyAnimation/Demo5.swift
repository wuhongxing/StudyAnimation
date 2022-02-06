//
//  Demo5.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2022/2/6.
//

import Foundation
import UIKit

class Demo5 {
    let view: UIView
    
    private lazy var backgroundView: UIView = {
        let sonarView = UIView(frame: UIScreen.main.bounds)
        sonarView.backgroundColor = .green
        return sonarView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = UIColor.orange
        label.text = "TEST"
        label.sizeToFit()
        return label
    }()
    
    init(_ view: UIView) {
        self.view = view
        view.addSubview(backgroundView)
        backgroundView.addSubview(label)
    }
    
    func gradient() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(white: 0, alpha: 0.2).cgColor, UIColor.white.cgColor, UIColor(white: 0, alpha: 0.2).cgColor]
        layer.locations = [0.25, 0.5, 0.75]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.frame = label.bounds
        label.layer.mask = layer
        
        let anim = CABasicAnimation(keyPath: "locations")
        anim.fromValue = [0.0, 0.0, 0.25]
        anim.toValue = [0.75, 1.0, 1.0]
        anim.duration = 1
        anim.repeatCount = .infinity
        layer.add(anim, forKey: "test")
    }
}
