//
//  ViewController.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let maskvc = MaskViewController()
        let maskvc = TimingViewController()
        navigationController?.pushViewController(maskvc, animated: true)
    }

}

