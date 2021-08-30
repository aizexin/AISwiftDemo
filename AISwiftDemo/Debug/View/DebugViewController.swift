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
    
    @IBOutlet weak var ipTextField: UITextField!
    @IBOutlet weak var isWriteInFile: UISwitch!
    
    // MARK: - Initial ---------
    init(presenter: P, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.presenter = presenter
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isWriteInFile.setOn(AIDebugLog.shared.isInputFile, animated: false)
    }
    
    // MARK: - action --
    @IBAction func checkAllLog(_ sender: Any) {
        presenter.perfromAction(.checkAllLog(fromVC: self))
    }
    @IBAction func onClickSwitchLoginFile(_ sender: UISwitch) {
        presenter.perfromAction(.onClickSwitchLoginFile(isIn: sender.isOn))
    }
    @IBAction func onClickEnter(_ sender: Any) {
        
    }
    @IBAction func onClickPrintFilePath(_ sender: Any) {
        presenter.perfromAction(.onClickPrintFilePath(text: ipTextField.text ?? ""))
    }
}
