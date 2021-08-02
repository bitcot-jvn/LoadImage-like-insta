//
//  UserModel.swift
//  MX Diamonds
//
//  Created by mac on 08/03/19.
//  Copyright © 2019 Chandan. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginModal : Mappable,Equatable {
    var email : String?
    var id : String?
    var mobileNo : String?
    var password : String?
    var name : String?
    var btcAddress : String?
    var seedPhrase: String?
    var passcodeExist: Bool?
   

    init?(map: Map) {}
    init() {}
    
    mutating func mapping(map: Map) {
        
        email <- map["email"]
        id <- map["id"]
        mobileNo <- map["mobileNo"]
        password <- map["password"]
        name <- map["name"]
        btcAddress <- map["btcAddress"]
        seedPhrase <- map["seedPhrase"]
        passcodeExist <-  map["passcodeExist"]
    }
}

struct CollectionModal : Mappable {
    var albumId : Int?
    var id : Int?
    var title : String?
    var url : String?
    var thumbnailUrl : String?
    
    init?() {}
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {

        albumId <- map["albumId"]
        id <- map["id"]
        title <- map["title"]
        url <- map["url"]
        thumbnailUrl <- map["thumbnailUrl"]
    }

}
