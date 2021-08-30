//
//  DebugPresenterProtocol.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/27.
//

import Foundation

protocol DebugPresenterType: AnyObject {
    associatedtype Action: DebugActionType
    // MARK: - view action -> Presenter ---------
    func perfromAction(_ action: DebugViewAction)
}
