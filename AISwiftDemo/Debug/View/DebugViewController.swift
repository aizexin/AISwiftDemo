//
//  DebugViewController.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/3.
//

import UIKit

class DebugViewController<P: DebugPresenterType>: UIViewController, DebugViewType {
    // MARK: - property --

    let presenter: P

    @IBOutlet var ipTextField: UITextField!
    @IBOutlet var isWriteInFile: UISwitch!

    // MARK: - Initial ---------

    init(presenter: P, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.presenter = presenter
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isWriteInFile.setOn(AIDebugLog.shared.isInputFile, animated: false)
    }

    // MARK: - action --

    @IBAction func checkAllLog(_: Any) {
        presenter.perfromAction(.checkAllLog(fromVC: self))
    }

    @IBAction func onClickSwitchLoginFile(_ sender: UISwitch) {
        presenter.perfromAction(.onClickSwitchLoginFile(isIn: sender.isOn))
    }

    @IBAction func onClickEnter(_: Any) {}

    @IBAction func onClickPrintFilePath(_: Any) {
        presenter.perfromAction(.onClickPrintFilePath(text: ipTextField.text ?? ""))
    }
}
