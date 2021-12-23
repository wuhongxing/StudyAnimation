//
//  TimingViewController.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2021/12/19.
//

import UIKit

class TimingViewController: UIViewController {
    private lazy var view1: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 100, width: 25, height: 25))
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(view1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let ani = CABasicAnimation(keyPath: CAValueFunctionName.translateX.rawValue)
        ani.fromValue = 0
        ani.toValue = view.frame.width
        view1.layer.add(ani, forKey: "ani")
    }
}
