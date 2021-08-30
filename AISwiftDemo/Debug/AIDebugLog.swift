//
//  AIDebugLog.swift
//  AISwiftDemo
//
//  Created by aizexin on 2021/7/9.
//

import UIKit
import DateToolsSwift

class AIDebugLog: NSObject {
    static let shared = AIDebugLog()
    // MARK: - property ---------
    var isInputFile: Bool = false
    /// 沙盒路径
    private var pathDocuments: String!
    private (set) var folderPath: String!
    fileprivate var logQueue: DispatchQueue = DispatchQueue(label: "CLLogManager.logQueue")
    fileprivate lazy var logFileHandle: FileHandle? = {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: folderPath) {
            try? fileManager.createDirectory(atPath: folderPath, withIntermediateDirectories: true, attributes: nil)
        }
        let logArray = AIDebugLog.logPathArray
        if logArray.count >= 40, let lastFilePath = logArray.last, fileManager.fileExists(atPath: lastFilePath) {
            try? fileManager.removeItem(atPath: lastFilePath)
        }
        let time = Date(timeIntervalSinceNow: 0).format(with: "yyyy-MM-dd HH:mm:ss")
        // 新增第0的一个文件
        let currentFilePath = folderPath + "/\(time)" + ".log"
        fileManager.createFile(atPath: currentFilePath, contents: nil, attributes: nil)
        let fileHandle = FileHandle(forWritingAtPath: currentFilePath)
        fileHandle?.truncateFile(atOffset: 0)
        return fileHandle
    }()
    /// log路径数组
    class var logPathArray: [String] {
        return findAllFile(type: "log", folderPath: shared.folderPath).sorted { (path1, path2) -> Bool in
            let date1 = Date(dateString: (path1.lastPathComponent as NSString).deletingPathExtension, format: "yyyy-MM-dd HH:mm:ss")
            let date2 = Date(dateString: (path2.lastPathComponent as NSString).deletingPathExtension, format: "yyyy-MM-dd HH:mm:ss")
            return date1.isLater(than: date2)
        }
    }
    private override init() {
        self.pathDocuments = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        self.folderPath    = pathDocuments + "/CLLog"
    }
    func deleteAllLogFile() {
        deleteFielWithPath(path: folderPath)
    }
}

func print<T>(_ msg: T, file: NSString = #file, line: Int = #line, function: String = #function, isInputFile: Bool = AIDebugLog.shared.isInputFile) {
    #if DEBUG
    let prefix = "\(file.lastPathComponent)_\(line)_\(function):"
    print(prefix, msg)
    #endif
    if isInputFile {
        AIDebugLog.shared.logQueue.async {
            guard let output = AIDebugLog.shared.logFileHandle else {
                return
            }
            guard var text = msg as? String else {return}
            text = prefix + " " + text + "\n"
            if let textData = text.data(using: .utf8) {
                output.write(textData)
            }
        }
    }
}

/// 查找路径及其子路径下所有指定类型文件
func findAllFile(type: String, folderPath: String, maxCount: Int = .max) -> [String] {
    let manager = FileManager.default
    let dirEnum = manager.enumerator(atPath: folderPath)
    var fileArray = [String]()
    while let file = dirEnum?.nextObject() as? String {
        if type == file.pathExtension {
            fileArray.append("\(folderPath)/\(file)")
        }
        if fileArray.count == maxCount {
            break
        }
    }
    return fileArray
}

func deleteFielWithPath(path: String) {
    let manager = FileManager.default
    do {
        try manager.removeItem(atPath: path)
    } catch {
        print("删除文件失败", isInputFile: false)
    }
}

extension String {
    /// 最后的文件路径
    var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    /// 文件后缀
    var pathExtension: String {
        return (self as NSString).pathExtension
    }
}
