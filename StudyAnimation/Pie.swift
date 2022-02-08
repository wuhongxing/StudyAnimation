//
//  Pie.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2022/2/6.
//

import Foundation
import UIKit

class Pie {
    let view: UIView
    
    private lazy var backgroundView: UIView = {
        let sonarView = UIView(frame: UIScreen.main.bounds)
        sonarView.backgroundColor = .green
        return sonarView
    }()
    
    init(_ view: UIView) {
        self.view = view
        view.addSubview(backgroundView)
        view.layer.drawsAsynchronously
    }
    
    func drawPie() {
        let array = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.orange.cgColor]
        for i in 0 ..< 3 {
            let layer = CAShapeLayer()
            layer.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 100, y: 100))
            path.addArc(withCenter: CGPoint(x: 100, y: 100), radius: 50, startAngle: .pi / 3 * CGFloat(i) * 2, endAngle: CGFloat(.pi / CFloat(3) * CFloat(i) + .pi / 3) * 2, clockwise: true)
            layer.fillColor = array[i]
            layer.path = path.cgPath
            backgroundView.layer.addSublayer(layer)
        }
    }
}
