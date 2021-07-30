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
        self.tabBar.tintColor = Asset.Colors.themeColor.color
    }
    
    func configureViewControllers() {
        let myProfileImage = Asset.Assets.icon.image.withRenderingMode(.alwaysOriginal)
        let myProfileItem = UITabBarItem(title: L10n.tabMy,image: myProfileImage,tag: TabBarItemTag.myProfileItem.rawValue)
        myProfileItem.selectedImage = myProfileImage
        let myProfileVC = MyProfileViewController()
        myProfileVC.tabBarItem = myProfileItem
        self.viewControllers = [myProfileVC]
    }
}
