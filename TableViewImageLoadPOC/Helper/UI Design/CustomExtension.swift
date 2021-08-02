//
//  CustomExtensions.swift
//  Speed Shopper
//
//  Created by mac on 10/04/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit



class UnderlinedLabel: UILabel {
    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
}

extension UITextField{
    func isEmpty() -> Bool{
        if (self.text?.isEmpty)!{
            return true
        }
        return false
    }
    
    func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text)
    }
    
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,15}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self.text)
    }
    
    func isValidCotactNumber() -> Bool{
        
        if (self.text?.count)! < 7 || (self.text?.count)! > 14 {
            return false
        }
        return true
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

 extension UITextView{
    func isEmpty() -> Bool{
        if (self.text?.isEmpty)!{
            return true
        }
        return false
    }
    
}

//extension UIColor{
//    class func hexStringToUIColor (_ hex:String) -> UIColor {
//        var cString:String = hex.trimmingCharacters(in: (NSCharacterSet.whitespacesAndNewlines as NSCharacterSet) as CharacterSet).uppercased()
//        
//        if (cString.hasPrefix("#")) {
//            cString = String(cString.removeFirst())
////            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
////            cString = String(cString[cString.index(cString.startIndex, offsetBy: 1)..])
//        }
//        if ((cString.count) != 6) {
//            return UIColor.gray
//        }
//        
//        var rgbValue:UInt32 = 0
//        Scanner(string: cString).scanInt(rgbValue)//scanHexInt32(&rgbValue)
//        
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
//}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}


   

