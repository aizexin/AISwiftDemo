//
//  MyProfileViewController.swift
//  AISwiftDemo
//
//  Created by aizexin on 2021/7/9.
//

import UIKit

class MyProfileViewController: MyProfileBaseViewController {
    // MARK: - Define -------------

    var tableview: UITableView!

    // MARK: - External -----------

    // MARK: - Initial ------------

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        self.tableview = UITableView(frame: self.view.bounds, style: .plain)
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.view.addSubview(tableview)
    }

    // MARK: - Networking ---------

    // MARK: - Checking -----------

    // MARK: - Action -------------

    // MARK: - Tools --------------
}

// MARK: - Delegate -----------

extension MyProfileViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        MainRouter.shared.perfromJump(from: self, vc: .debug)
    }
}

extension MyProfileViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 7
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "") ?? UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
