//
//  Demo4.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2022/2/6.
//

import Foundation
import UIKit

// TODO: 画一个不同颜色的圆
class Demo4 {
    let view: UIView
    let layer: CAShapeLayer
    
    private lazy var backgroundView: UIView = {
        let sonarView = UIView(frame: UIScreen.main.bounds)
        sonarView.backgroundColor = .green
        return sonarView
    }()
    
    init(_ view: UIView) {
        self.view = view
        layer = CAShapeLayer()
        view.addSubview(backgroundView)
        initProgressLayer()
    }
    
    private var strokeEnd: CGFloat = 0 {
        didSet {
            layer.strokeEnd = strokeEnd
        }
    }
    
    private func initProgressLayer() {
        layer.position = .zero
        layer.lineWidth = 3
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = nil
        layer.strokeEnd = 0
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: 48.5, y: 48.5), radius: 47, startAngle: -.pi / 2, endAngle: -.pi / 2 + .pi * 2, clockwise: true)
        layer.path = path.cgPath
        
        let glayer = CAGradientLayer()
        glayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        glayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.cyan.cgColor]
        glayer.locations = [0, 0.5, 1]
        /*
         The layer’s alpha channel determines how much of the layer’s content and background shows through. Fully or partially opaque pixels allow the underlying content to show through, but fully transparent pixels block that content.
         The default value of this property is nil. When configuring a mask, remember to set the size and position of the mask layer to ensure it is aligned properly with the layer it masks.
         */
        // 其实本质就是和前面的像素做乘运算
        // 1 全部显示，0 全不显示
        glayer.mask = layer
        
        backgroundView.layer.addSublayer(glayer)
    }
    
    func progress() {
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = 1
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        layer.add(anim, forKey: "test")
    }
}
