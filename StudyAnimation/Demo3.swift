//
//  Demo3.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2022/2/6.
//

import Foundation
import UIKit

class Demo3 {
    let view: UIView
    
    private lazy var backgroundView: UIView = {
        let sonarView = UIView(frame: UIScreen.main.bounds)
        sonarView.backgroundColor = .green
        return sonarView
    }()
    
    init(_ view: UIView) {
        self.view = view
        view.addSubview(backgroundView)
    }
    
    var subViews: ContiguousArray<UIView> = []
    
    func loading() {
        for i in 0 ..< 3 {
            let view = UIView(frame: CGRect(x: 100 + 15 * i, y: 100, width: 10, height: 10))
            view.layer.cornerRadius = 5
            view.backgroundColor = .white
            backgroundView.addSubview(view)
            subViews.append(view)
        }
        subViews.enumerated().forEach { (index, view) in
            UIView.animate(withDuration: 0.6, delay: Double(index) * 0.2, options: [.repeat, .autoreverse]) {
                self.subViews[index].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }
        }
    }
}
