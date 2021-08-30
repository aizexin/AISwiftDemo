//
//  DebugLogFileListViewController.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/25.
//

import UIKit

class DebugLogFileListViewController: UIViewController {

    // MARK: - property ---------
    var tableview: UITableView!
    var dataSource = [String]()
    
    // MARK: - life cycle ---------
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureUI()
        configureNavigation()
    }
    // MARK: - Initial ---------
    func configureData() {
        self.dataSource = findAllFile(type: "log", folderPath: AIDebugLog.shared.folderPath)
    }
    func configureUI() {
        self.tableview = UITableView(frame: self.view.bounds, style: .plain)
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.view.addSubview(tableview)
    }
    func configureNavigation() {
        let rightBtn = UIBarButtonItem(title: "delete", style: .plain, target: self, action: #selector(deleteAllFile))
        rightBtn.tintColor = Asset.Colors.themeColor.color
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    // MARK: - action ---------
    @objc func deleteAllFile() {
        self.dataSource = []
        self.tableview.reloadData()
        AIDebugLog.shared.deleteAllLogFile()
    }
}

// MARK: - Delegate -----------
extension DebugLogFileListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let params = ["filePath": self.dataSource[indexPath.row]]
        DebugRouter.shared.perfromJump(from: self, vc: .debug_openLogFile, params: params)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let fullPath = self.dataSource[indexPath.row]
        deleteFielWithPath(path: fullPath)
        self.dataSource.remove(at: indexPath.row)
        tableview.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        return
    }
}
extension DebugLogFileListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "") ?? UITableViewCell()
        cell.textLabel?.text = self.dataSource[indexPath.row].lastPathComponent
        return cell
    }
}
