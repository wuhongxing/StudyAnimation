//
//  ViewController.swift
//  StudyAnimation
//
//  Created by 吴红星 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var dataSource = ["开锁", "水波纹", "loading", "progress", "文字渐变"]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "test")
        if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: "test") }
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: Demo1(view).openLock()
        case 1: Demo2(view).sonar()
        case 2: Demo3(view).loading()
        case 3: Demo4(view).progress()
        case 4: Demo5(view).gradient()
        default: break
        }
    }
}

