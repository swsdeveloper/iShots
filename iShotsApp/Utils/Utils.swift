//
//  Utils.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

import Foundation

class Utils {
    
    class func getStringFromJSON(data: NSDictionary, key: String) -> String {
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
    
}