//
//  Theme.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

import Foundation
import UIKit

class Theme {
    
    class var fontName : String {
        return "Avenir-Book"
    }
    
    class var boldFontName : String {
        return "Avenir-Black"
    }
    
    class var semiBoldFontName : String {
        return "Avenir-Heavy"
    }
    
    class var lighterFontName : String {
        return "Avenir-Light"
    }
    
    class var darkColor : UIColor {
        return UIColor.blackColor()
    }
    
    class var lightColor : UIColor {
        return UIColor(white: 0.6, alpha: 1.0)
    }
    
}