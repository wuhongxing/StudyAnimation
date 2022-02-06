//
//  Demo2.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2022/2/6.
//

import Foundation
import UIKit

class Demo2 {
    let view: UIView
    
    private lazy var backgroundView: UIView = {
        let sonarView = UIView(frame: UIScreen.main.bounds)
        sonarView.backgroundColor = .cyan
        return sonarView
    }()
    
    init(_ view: UIView) {
        self.view = view
        view.addSubview(backgroundView)
    }
    
    func sonar() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        var result: ContiguousArray<UIView> = []
        (0 ..< 3).forEach { _ in
            let view1 = UIView(frame: CGRect(x: width / 2, y: height / 2, width: 1, height: 1))
            view1.layer.cornerRadius = 0.5
            view1.backgroundColor = .orange
            backgroundView.addSubview(view1)
            result.append(view1)
        }
        
        result.enumerated().forEach { (index, view) in
            let group = CAAnimationGroup()
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 0
            animation.toValue = 100
            let animation1 = CABasicAnimation(keyPath: "opacity")
            animation1.fromValue = 1
            animation1.toValue = 0

            group.repeatCount = .infinity
            group.isRemovedOnCompletion = false
            group.fillMode = .forwards
            group.duration = 2
            group.beginTime = Double(index) / 3 * 2
            group.animations = [animation, animation1]
            view.layer.add(group, forKey: "test")
        }
    }
}
