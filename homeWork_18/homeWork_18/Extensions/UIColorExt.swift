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
            self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init?(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        var rgb: UInt64 = 0
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
                red = CGFloat((rgb & 0xFF0000) >> 16)
                green = CGFloat((rgb & 0x00FF00) >> 8)
                blue = CGFloat(rgb & 0x0000FF)
        self.init(red: Int(red), green: Int(green), blue: Int(blue))
    }
}
