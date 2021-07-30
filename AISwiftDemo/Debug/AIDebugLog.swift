//
//  AIDebugLog.swift
//  AISwiftDemo
//
//  Created by aizexin on 2021/7/9.
//

import UIKit

class AIDebugLog: NSObject {
    
}

func print<T>(_ msg :T, file :NSString = #file, line :Int = #line, function :String = #function) {
    #if DEBUG
    let prefix = "\(file.lastPathComponent)_\(line)_\(function):"
    print(prefix, msg)
    #endif
}
