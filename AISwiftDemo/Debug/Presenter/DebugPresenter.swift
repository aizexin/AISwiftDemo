//
//  DebugPresenter.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/27.
//

import UIKit

class DebugPresenter<PerfromAction: DebugActionType>: DebugPresenterType {
    typealias Action = DebugViewAction
    // MARK: - view action -> Presenter ---------
    func perfromAction(_ action: Action) {
        switch action {
        case let .checkAllLog(fromVC):
            DebugRouter.shared.perfromJump(from: fromVC, vc: .debug_logList)
        case let .onClickSwitchLoginFile(isIn):
            AIDebugLog.shared.isInputFile = isIn
        case .onClickEnter(_):
            break
        case let .onClickPrintFilePath(text):
            print(text)
            print(NSHomeDirectory() + "/Documents", isInputFile: false)
        }
    }
}

enum DebugViewAction: DebugActionType {
    case checkAllLog(fromVC: UIViewController)
    case onClickSwitchLoginFile(isIn: Bool)
    case onClickEnter(fromVC: UIViewController)
    case onClickPrintFilePath(text: String)
}

protocol DebugActionType {
}
