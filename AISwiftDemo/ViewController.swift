//
//  ViewController.swift
//  AISwiftDemo
//
//  Created by aizexin on 2021/5/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        test()
    }
}

func test() {
    let str = NSLocalizedString("test", comment: "")
    print("111",str)
    let host = ConfigureModel.sharedInstance.getHost()
    print(host)
}
