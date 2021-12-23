//
//  MaskViewController.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2021/12/18.
//

import UIKit

class MaskViewController: UIViewController {
    private lazy var view1: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 100, width: view.frame.width - 20, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }()
    
    private lazy var view2: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 220, width: view.frame.width - 20, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(view1)
        view.addSubview(view2)
        
        let layer1 = CALayer()
        layer1.frame = CGRect(x: 20, y: 20, width: view1.bounds.width - 40, height: view1.bounds.height - 40)
        layer1.backgroundColor = UIColor(white: 0, alpha: 0).cgColor
        view1.layer.mask = layer1
    }
    
}

