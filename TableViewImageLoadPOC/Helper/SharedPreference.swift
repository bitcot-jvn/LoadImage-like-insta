//
//  SharedPreference.swift
//  Speed Shopper
//
//  Created by info on 14/04/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class SharedPreference: NSObject {
   
    fileprivate let kemail = "__email_"
    fileprivate let kid = "__id_"
    fileprivate let kmobileNo = "__mobileNo_"
    fileprivate let kpassword = "--password"
    fileprivate let kname = "___name"
    fileprivate let kbtcAddress = "__btcAddress__"
    fileprivate let kuser_type = "__user_type_"
    fileprivate let kDeviceToken = "__DeviceToken__"
    fileprivate let kjwtToken = "__jwtToken__"
    fileprivate let kBtcAdresss = "__kBtcAdresssn__"
    fileprivate let kETHAdresss = "__kETHAdresssn__"
    
    fileprivate let kCoin = "======kCoin"
    fileprivate let defaults = UserDefaults.standard
    static let sharedInstance = SharedPreference()
    class func saveUserData(user:LoginModal){
        sharedInstance.saveUserData(user)
    }
    
    
    fileprivate func saveUserData(_ user: LoginModal){
        defaults.set(user.email, forKey: kemail)
        defaults.set(user.mobileNo, forKey: kmobileNo)
        defaults.set(user.id, forKey: kid)
        defaults.set(user.password, forKey: kpassword)
        defaults.set(user.name, forKey: kname)
        defaults.set(user.btcAddress, forKey: kbtcAddress)
        
        defaults.synchronize()
    }
    
    fileprivate func deleteUserData(){
        defaults.removeObject(forKey: kemail)
        defaults.removeObject(forKey: kid)
        defaults.removeObject(forKey: kmobileNo)
        defaults.removeObject(forKey: kpassword)
        defaults.removeObject(forKey: kname)
        defaults.removeObject(forKey: kbtcAddress)
       // defaults.removeObject(forKey: kprofile_pic)
       
        defaults.synchronize()
    }
    
   
    
    class func clearUserData(){
        sharedInstance.clearUserData()
    }
    
    fileprivate func clearUserData(){
        self.deleteUserData()
    }
    
    class func getUserData() -> LoginModal{
        return sharedInstance.getUserData()
    }
    
    fileprivate  func getUserData() -> LoginModal {
        var user:LoginModal  = LoginModal()
        user.email          = defaults.value(forKey: kemail)  as? String
        user.id          = defaults.value(forKey: kid)  as? String
        user.mobileNo          = defaults.value(forKey: kmobileNo)  as? String
        user.password          = defaults.value(forKey: kpassword)  as? String
        user.name          = defaults.value(forKey: kname)  as? String
        user.btcAddress          = defaults.value(forKey: kbtcAddress)  as? String
       // user.profile_pic          = defaults.value(forKey: kprofile_pic)  as? String
      
        return user
    }
    
    func setCurrentLocation(lat: Double, long: Double){
        defaults.synchronize()
    }
    
   
    fileprivate func setjwtToken(_ token: String){
        defaults.set(token, forKey: kjwtToken);
    }
    
    fileprivate func getjwtToken() -> String?{
        return defaults.value(forKey: kjwtToken) as? String;
    }
    
    class func storejwtToken(_ token: String) {
        sharedInstance.setjwtToken(token)
    }
    
    class func jwtToken() -> String {
        return sharedInstance.getjwtToken() ?? "1234567890"
    }
    // btc address
    class func storeBTCAddress(_ token: String) {
        sharedInstance.setBTCAddress(token)
    }
    
    class func BTCAddress() -> String {
        return sharedInstance.getBTCAddress() ?? "nil"
    }
    
    fileprivate func setBTCAddress(_ token: String){
        defaults.set(token, forKey: kBtcAdresss);
    }
    
    fileprivate func getBTCAddress() -> String?{
        return defaults.value(forKey: kBtcAdresss) as? String;
    }
    //eth
    class func storeETHAddress(_ token: String) {
        sharedInstance.setETHAddress(token)
    }
    
    class func ETHAddress() -> String {
        return sharedInstance.getETHAddress() ?? "nil"
    }
    
    fileprivate func setETHAddress(_ token: String){
        defaults.set(token, forKey: kETHAdresss);
    }
    
    fileprivate func getETHAddress() -> String?{
        return defaults.value(forKey: kETHAdresss) as? String;
    }
    
    
    fileprivate func setDeviceToken(_ token: String){
        defaults.set(token, forKey: kDeviceToken);
    }
    
    fileprivate func getDeviceToken() -> String?{
        return defaults.value(forKey: kDeviceToken) as? String;
    }
    
    class func storeDeviceToken(_ token: String) {
        sharedInstance.setDeviceToken(token)
    }
    
    class func deviceToken() -> String {
        return sharedInstance.getDeviceToken() ?? "1234567890"
    }
    
    // coin
    
    fileprivate func setCoin(_ coin: String){
        defaults.set(coin, forKey: kCoin);
    }
    
    fileprivate func getCoin() -> String?{
        return defaults.value(forKey: kCoin) as? String;
    }
    
    class func storeCoin(_ coin: String) {
        sharedInstance.setCoin(coin)
    }
 
    class func coin() -> String {
        return sharedInstance.getCoin() ?? "btc"
    }
}
