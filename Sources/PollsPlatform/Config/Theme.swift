//
//  Theme.swift
//  Polls Platform Example iOS App
//
//  Created by Jeff Hanna on 4/17/23.
//

import UIKit

struct Theme {
    var backgroundColor: UIColor
    var loadingTitleColor: UIColor
    var loadingIndicatorColor: UIColor
}

class ThemeManager {
    
    // static colors
    
    static let blueSteel = UIColor(red: 52/255, green: 62/255, blue: 87/255, alpha: 1.0)
    static let lightBackground = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
    static let darkBackground = UIColor(red: 14/255, green: 14/255, blue: 15/255, alpha: 1.0)
    static let lightTint = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
    static let darkTint = blueSteel
    
    // themes
    
    static let lightTheme = Theme(backgroundColor: lightBackground,
                                  loadingTitleColor: darkTint,
                                  loadingIndicatorColor: darkTint)
    
    static let darkTheme = Theme(backgroundColor: darkBackground,
                                 loadingTitleColor: lightTint,
                                 loadingIndicatorColor: lightTint)
    
    static let currentTheme: Theme = lightTheme
    
}

