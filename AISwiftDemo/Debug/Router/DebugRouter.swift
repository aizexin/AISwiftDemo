//
//  DebugRouter.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/27.
//

import UIKit

class DebugRouter: NSObject {
    static let shared = DebugRouter()
    private override init() {}
    // MARK: - debug 模块内跳转方法 ---------
    func perfromJump(from: UIViewController?, vc: DebugViewControllerType, params: [String: Any] = [:]) {
        switch vc {
        case .debug_logList:
            let loglistVC = DebugLogFileListViewController()
            from?.navigationController?.pushViewController(loglistVC, animated: true)
        case .debug_openLogFile:
            guard let filePath = params["filePath"] as? String else {
                break
            }
            let webVC = DebugLocalFileViewController()
            webVC.logfilePath = filePath
            from?.navigationController?.pushViewController(webVC, animated: true)
        }
    }
}
