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
        // home
        let homeImage = Asset.Assets.home.image.withRenderingMode(.alwaysOriginal)
        let homeItem  = UITabBarItem(title: L10n.tabHome, image: homeImage, tag: TabBarItemTag.homeItem.rawValue)
        homeItem.selectedImage = homeImage
        let homeVC        = HomeViewController()
        homeVC.tabBarItem = homeItem
        let homeNav       = UINavigationController.init(rootViewController: homeVC)
        homeVC.title      = L10n.tabHome
        // my
        let myProfileImage = Asset.Assets.myLaunch.image.withRenderingMode(.alwaysOriginal)
        let myProfileItem  = UITabBarItem(title: L10n.tabMy, image: myProfileImage, tag: TabBarItemTag.myProfileItem.rawValue)
        myProfileItem.selectedImage = myProfileImage
        let myProfileVC             = MyProfileViewController()
        myProfileVC.tabBarItem      = myProfileItem
        
        self.viewControllers = [homeNav, myProfileVC]
    }
}
