//
//  DebugViewType.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/27.
//

import Foundation

protocol DebugViewType {
    associatedtype Presenter: DebugPresenterType
    /// A presenter
    var presenter: Presenter { get }
}
