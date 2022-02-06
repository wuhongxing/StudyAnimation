//
//  Demo1.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2022/2/6.
//

import Foundation
import UIKit

class Demo1 {
    let view: UIView
    
    init(_ view: UIView) {
        self.view = view
        view.addSubview(lockView)
    }
    
    private lazy var lockView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .brown
        return view
    }()
    
    func openLock() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let view1 = TestView(frame: CGRect(x: 0, y: 0, width: width, height: height / 2))
        view1.backgroundColor = .white
        
        let view2 = TestView(frame: CGRect(x: 0, y: height / 2, width: width, height: height / 2))
        view2.backgroundColor = .white
        lockView.addSubview(view2)
        
        let lock = TestView(frame: CGRect(x: width / 2 - 50, y: height / 2 - 50, width: 100, height: 100))
        lock.backgroundColor = .red
        lock.layer.zPosition = 10
        view1.addSubview(lock)
        lockView.addSubview(view1)
        
        UIView.animate(withDuration: 1) {
            lock.transform = CGAffineTransform(rotationAngle: .pi / 2)
        } completion: { finished in
            if finished {
                UIView.animate(withDuration: 1) {
                    view1.transform = CGAffineTransform(translationX: 0, y: -height / 2 - 50)
                    view2.transform = CGAffineTransform(translationX: 0, y: height / 2)
                } completion: { finished in
                    if finished {
                        // 这里能保证及时释放
                        self.lockView.removeFromSuperview()
                    }
                }
            }
        }

    }
}
