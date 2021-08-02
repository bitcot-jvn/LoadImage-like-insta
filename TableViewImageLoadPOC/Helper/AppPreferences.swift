//  AppPreferences.swift
//  SmartBookingCustomer
//  Created by Jayant Patidar on 22/09/16.
//  Copyright © 2016 Infograins. All rights reserved.
//

import UIKit

extension UIApplication {
    class func isRTL() -> Bool{
        /*if AppPreferences.currentLanguage == AppLanguage.arabic {
            return false
        }else{
            return false
        }*/
        
        return false
    }
}

private extension String {
    var language: AppLanguage {
        if self == AppLanguage.English.code {
            return .English
        }else{
            return .Arabic
        }
    }
}

extension String {
    var localized: String {
        if Bundle.main.path(forResource: Constants.Localized.LocalizedFileKey, ofType: "strings", inDirectory: nil, forLocalization: AppPreferences.currentLanguage.code) != nil{
            var bundle = Bundle()
            let _path = Bundle.main.path(forResource: "\(AppPreferences.currentLanguage.code)", ofType: "lproj")
            bundle = Bundle(path: _path!)!

            let string = bundle.localizedString(forKey: self, value: nil, table: nil)
            return string
        }
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

enum AppLanguage {
    case English
    case Arabic
    
}

extension AppLanguage {
    typealias AppLang = Constants.AppPrefrencesConstants.AppLanguage
    
    var code: String{
        switch self {
        case .English:
            return AppLang.Code.English
        case .Arabic:
            return AppLang.Code.Arabic
        }
    }
    
    var title: String{
        switch self {
        case .English:
            return AppLang.Title.English
        case .Arabic:
            return AppLang.Title.Arabic
        }
    }
}

struct AppPreferences {
    fileprivate init(){
        
    }
    
    static  var currentLanguage:AppLanguage {
        let defaults = UserDefaults.standard
        
        if defaults.value(forKey: Constants.AppPrefrencesConstants.CurrentLanguageKey) == nil {
            defaults.setValue(AppLanguage.English.code, forKey: Constants.AppPrefrencesConstants.CurrentLanguageKey);
            defaults.synchronize();
        }
        return defaults.string(forKey: Constants.AppPrefrencesConstants.CurrentLanguageKey)!.language
    }
    
    static func changeUIForLanguage() {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UIButton.appearance().semanticContentAttribute =  .forceRightToLeft
        UILabel.appearance().semanticContentAttribute = .forceRightToLeft
        UITextField.appearance().textAlignment = .right
        UITextField.appearance().semanticContentAttribute = .forceRightToLeft
        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
    }
    static func changeUIForEnglishLanguage() {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        UIButton.appearance().semanticContentAttribute =  .forceLeftToRight
        UILabel.appearance().semanticContentAttribute = .forceLeftToRight
        UITextField.appearance().textAlignment = .left
        UITextField.appearance().semanticContentAttribute = .forceLeftToRight
        UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
    }
    
    static func updatedStoryboardLng(lag:String){
        let standardDefault = UserDefaults.standard
        standardDefault.set(lag, forKey: "AppleLanguages")
        standardDefault.synchronize()
    }
    
    static func updateStoryBoradForLanguage(_ key: String, value: String?, table tableName: String?){
        let cLCode = self.currentLanguage.code
        var bundle = Bundle()
        if let _path = Bundle.main.path(forResource: "\(cLCode)", ofType: "lproj") {
            bundle = Bundle(path: _path)!
            bundle.localizedString(forKey: key, value: value, table: tableName)
            
        } else {
            let _path = Bundle.main.path(forResource: "\(cLCode)", ofType: "lproj")!
            bundle = Bundle(path: _path)!
        }
    }
    
    static fileprivate func saveDefaults(_ value: AnyObject, forKey: String){
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: forKey)
    }
    
    static fileprivate func getStringFromDefaults(_ key:String)  -> String?{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: key)
    }
    
    static func setLanguage(_ language: AppLanguage){
        self.saveDefaults(language.code as AnyObject, forKey: Constants.AppPrefrencesConstants.CurrentLanguageKey)
        // self.changeUIForLanguage()
        // NotificationsHandler.postNotification(language, message: nil)
    }
    
    static func appLang(){
    }
}

extension UIView
{
    var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection
    {
        if #available(iOS 9.0, *) {
            return UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute)
        } else {
            return UIApplication.shared.userInterfaceLayoutDirection
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
}

