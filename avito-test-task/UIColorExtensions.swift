//
//  UIColorExtensions.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static var purpleEBColor: UIColor {
        return hexStringToUIColor(hex: "#8247ee")
    }
    
    static var pinkEBColor: UIColor {
        return hexStringToUIColor(hex: "#c56ce6")
    }
    
    static var purpleEBColorSecond: UIColor {
        return hexStringToUIColor(hex: "#784feb")
    }
    
    static var hazelnutPink: UIColor {
        return UIColor(red: 245, green: 83, blue: 118)
    }
    
    static var watermelonGreen: UIColor {
        UIColor(red: 98, green: 223, blue: 190)
    }
    
    static var plumPurple: UIColor {
        return UIColor(red: 108, green: 24, blue: 255)
    }
    
    static var greenEBColor: UIColor {
        return hexStringToUIColor(hex: "#44DB5E")
    }
    
    static var whiteSmoke: UIColor {
        return UIColor(red: 245, green: 245, blue: 245)
    }
    
    static var grayChateau: UIColor {
        return UIColor(red: 163, green: 164, blue: 168)
    }
}
