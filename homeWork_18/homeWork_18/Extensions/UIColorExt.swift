//
//  UIColorExt.swift
//  homeWork_18
//
//  Created by Евгений Лойко on 10.09.23.
//

import UIKit

extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return NSString(format:"%06x", rgb) as String
    }

    convenience init(red: Int, green: Int, blue: Int) {
//            assert(red >= 0 && red <= 255, "Invalid red component")
//            assert(green >= 0 && green <= 255, "Invalid green component")
//            assert(blue >= 0 && blue <= 255, "Invalid blue component")

            self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        }
}

//extension UITextField {
//    func hexStringToRGB(_ hexString: String) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
//        let cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//        if ((cString.count) != 6) {
//            return (red: 0.0, green: 0.0, blue: 0.0)
//        }
//
//        var rgbValue: UInt32 = 0
//        Scanner(string: cString).scanHexInt32(&rgbValue)
//
//        return (
//            red: CGFloat((rgbValue & 0xFF0000) >> 16),
//            green: CGFloat((rgbValue & 0x00FF00) >> 8),
//            blue: CGFloat(rgbValue & 0x0000FF))
//    }
//}
