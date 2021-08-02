//
//  BaseModelProtocol.swift
//  Speed Shopper
//
//  Created by mac on 13/04/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

protocol BaseModelProtocol: Mappable {
    associatedtype Object
    var success : Any? {get set}
    var msg : String? {get set}
    var err : String? {get set}
    var object : Object? {get set}
}

struct UniversalModel: Mappable {
    var success : Any?
    var msg : String?
    var err : String?
    var dictype : [String : String]?
    
    var isSuccess: Bool{
        guard let status = self.success else{
            return false
        }
        let statusInt = status as! Int
        if statusInt == 200 {
            return true
        }else {
            return false
        }
    }
    init?(map: Map) {}
    init() {}
    mutating func mapping(map: Map) {
        success       <- map["status"]
        msg           <- map["message"]
        err           <- map["error"]
        dictype       <- map["userData"]
    }
}

struct BaseModel<T: Mappable> : BaseModelProtocol {
    var success: Any?
    var msg: String?
    var err: String?
    var object: T?
    var list:T?
    var message: String?
    
    var isSuccess : Bool{
        guard let status = self.success else{
            return false
        }
        let statusInt = status as? String
        if statusInt == "1" {
            return true
        }
        else {
            return false
        }
    }
    
    var isVerify: Bool {
        guard let str2 = self.success else{return false}
        if "\(str2)" == "400" {
            return true
        }else{
            return false
        }
    }

    init?(map: Map) {}
    init() {}
    mutating func mapping(map: Map) {
        success       <- map["status"]
        msg           <- map["message"]
        err           <- map["error"]
        object        <- map["details"]
        list            <- map["list"]
        message         <- map["message"]
       
    }
}

//

struct DocumentListModel<T: Mappable>: BaseModelProtocol {
    var success: Any?
    var msg: String?
    var err: String?
    var object: [T]?
    var payment_status : String?
    init(){}
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        success     <- map["status"]
        msg         <- map["message"]
        err         <- map["error"]
        object      <- map["data"]
    }
    
    var isPaymentStatus: Bool {
        guard let status = self.payment_status else{
            return false
        }
        let statusInt = status
        if statusInt == "1" {
            return true
        }else {
            return false
        }
    }
    
    var isSuccess: Bool {
        guard let status = self.success else{
            return false
        }
        let statusInt = status as! Int
        if statusInt == 200 {
            return true
        }else {
            return false
        }
    }
    var isVerify: Bool {
        guard let str2 = self.success else{return false}
        if "\(str2)" == "400" {
            return true
        }else {
            return false
        }
    }
}

struct BaseListModel<T: Mappable>: BaseModelProtocol {
    
    var success: Any?
    var msg: String?
    var err: String?
    var list: [T]?
    var object: T?
   
    init(){}
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        success <- map["success"]
        msg <- map["message"]
        err <- map["error"]
        list <- map["list"]
        object <- map["userData"]
       
    }
    
    var isSuccess: Bool {
        guard let status = self.success else{
            return false
        }
        let statusInt = status as? Bool
        if statusInt == true {
            return true
        }
        else {
            return false
        }
    }
    
    var isVerify: Bool {
        guard let status = self.success else{
            return false
        }
        let statusInt = status as? String
        if statusInt == "2" {
            return true
        }
        else {
            return false
        }
    }
    
    var isuccess:Bool{
        guard let status = self.success else{
            return false
        }
        let statusInt = status as? Int
        if statusInt == 1 {
            return true
        }
        else {
            return false
        }
    }
}
