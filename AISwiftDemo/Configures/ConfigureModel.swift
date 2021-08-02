//
//  ConfigureModel.swift
//  Worker
//
//  Created by 艾泽鑫 on 2021/4/7.
//

import UIKit

class ConfigureModel: NSObject {
    static let sharedInstance = ConfigureModel()
    
    var configs = [String: AnyObject]()
    
    override init() {
        super.init()
        let bundle = Bundle.main
        let path   = bundle.path(forResource: "Configuration", ofType: "plist", inDirectory: nil)
        let data = NSData(contentsOfFile: path ?? "")! as Data
        do {
          configs  = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String: AnyObject]
        } catch {
            fatalError("Failed to parse config plist")
        }
    }
    
    func getHost() -> String {
        return self.configs["host"] as! String
    }
}
