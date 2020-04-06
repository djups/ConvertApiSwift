//
//  ConfigModel.swift
//  ConvertApiCom
//
//  Created by Alex on 4/6/20.
//  Copyright © 2020 Alexei Jovmir. All rights reserved.
//

import Foundation

protocol ConfigModel: class {
    func getToken() -> String?
}

public final class ConfigImp: ConfigModel {
    var stringToken: String?
    
    func getToken() -> String? {
        return ConfigImp.shared.stringToken
    }
    
    public func saveToken(_ token: String) {
        ConfigImp.shared.stringToken = token
    }
    
    public class var shared: ConfigImp {
        struct Static {
            static let kbManager = ConfigImp()
        }
        return Static.kbManager
    }
}
