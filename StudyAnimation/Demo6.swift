//
//  Demo6.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2022/2/8.
//

import UIKit

// TODO: 后面把整个进度条加上，做的更好看一些
class Demo6: NSObject {
    var view: UIView
    
    private lazy var backgroundView: UIView = {
        let sonarView = UIView(frame: UIScreen.main.bounds)
        sonarView.backgroundColor = .green
        return sonarView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "test"))
        imageView.frame = backgroundView.bounds
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(_ view: UIView) {
        self.view = view
        super.init()
        view.addSubview(backgroundView)
        backgroundView.addSubview(imageView)
    }
    
    func open() {
        let mask = CAShapeLayer()
        let path = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2), radius: 10, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        mask.backgroundColor = UIColor.black.cgColor
        mask.path = path.cgPath
        imageView.layer.mask = mask
        
        let anim = CABasicAnimation(keyPath: "path")
        anim.fromValue = path
        anim.toValue = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2), radius: 500, startAngle: 0, endAngle: .pi * 2, clockwise: true).cgPath
        anim.duration = 1
//        anim.isRemovedOnCompletion = false
//        anim.fillMode = .forwards
        anim.delegate = self
        mask.add(anim, forKey: "test")
    }
}

extension Demo6: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            imageView.layer.mask = nil
        }
    }
}
