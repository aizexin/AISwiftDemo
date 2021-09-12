//
//  DebugLocalFileViewController.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/26.
//

import Social
import UIKit
import WebKit

class DebugLocalFileViewController: UIViewController {
    // MARK: - property ---------

    private var webview: WKWebView!
    var logfilePath: String = ""

    // MARK: - initial ---------

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - UI ---------

    func configureUI() {
        configureNavigation()
        configureWebView()
    }

    func configureWebView() {
        let configure = WKWebViewConfiguration()
        self.webview = WKWebView(frame: self.view.bounds, configuration: configure)
        let fileUrl = URL(fileURLWithPath: self.logfilePath)
        let readAccessUrl = URL(fileURLWithPath: AIDebugLog.shared.folderPath)
        self.webview.loadFileURL(fileUrl, allowingReadAccessTo: readAccessUrl)
        self.view.addSubview(webview)
    }

    func configureNavigation() {
        let rightBtn = UIBarButtonItem(title: "share", style: .plain, target: self, action: #selector(shareFile))
        rightBtn.tintColor = Asset.Colors.themeColor.color
        self.navigationItem.rightBarButtonItem = rightBtn
    }

    // MARK: - action ---------

    @objc func shareFile() {
        let fileUrl = URL(fileURLWithPath: self.logfilePath)
        let activityVC = UIActivityViewController(activityItems: [fileUrl], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
}
