//
//  MainViewController.swift
//  AISwiftDemo
//
//  Created by aizexin on 2021/7/9.
//

import UIKit
import ChameleonFramework

class MainViewController: UITabBarController {
    //MARK:- Define -------------
    //MARK:- External -----------
    //MARK:- Initial ------------
    //MARK:- Networking ---------
    //MARK:- Checking -----------
    //MARK:- Delegate -----------
    //MARK:- Action -------------
    //MARK:- Tools --------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureViewControllers()
        self.tabBar.tintColor = UIColor.init(hexString: "#CB020C")
    }
    
    func configureViewControllers() {
        let myProfileImage = UIImage(named: "匡威风格人物4")?.withRenderingMode(.alwaysOriginal)
        let myProfileItem = UITabBarItem(title: NSLocalizedString("tab_my", comment: ""),image: myProfileImage,tag: TabBarItemTag.myProfileItem.rawValue)
        myProfileItem.selectedImage = myProfileImage
        let myProfileVC = MyProfileViewController()
        myProfileVC.tabBarItem = myProfileItem
        self.viewControllers = [myProfileVC]
    }
}
