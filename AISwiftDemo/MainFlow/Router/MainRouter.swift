//
//  MainRouter.swift
//  AISwiftDemo
//
//  Created by aizexin on 2021/7/9.
//

import UIKit

class MainRouter: NSObject {
    static let shared = MainRouter()
    override private init() {}

    func perfromJump(from: UIViewController?, vc: ModulesType, params _: [String: Any] = [:]) {
        switch vc {
        case .home:
            break
        case .myProfile:
            break
        case .debug:
            let presenter = DebugPresenter<DebugViewAction>()
            let debugVC = DebugViewController<DebugPresenter>.init(presenter: presenter, nibName: "DebugViewController", bundle: Bundle.main)
            let nav = UINavigationController(rootViewController: debugVC)
            from?.present(nav, animated: true, completion: nil)
        }
    }
}
