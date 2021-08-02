//
//  ChatModal.swift
//  Talent Tech
//
//  Created by Hyperbeans on 30/01/21.
//  Copyright © 2021 Hyperbeans. All rights reserved.
//

import Foundation
import ObjectMapper

struct GroupInfoModal : Mappable {
    var group_id : Int?
    var event_id : Int?
    var group_name : String?
    var group_image : String?
    var group_admin_id : Int?
    var group_admin_name : String?
    var group_admin_email : String?
    var base_path : String?
    var media_path : String?
    var unread_message_count : String?
    var message : String?
    var message_type : String?
    var created_at : String?
    var members : [Members]?

    init?(map: Map) {

    }
    init?() {

    }

    mutating func mapping(map: Map) {

        group_id <- map["group_id"]
        event_id <- map["event_id"]
        group_name <- map["group_name"]
        group_image <- map["group_image"]
        group_admin_id <- map["group_admin_id"]
        group_admin_name <- map["group_admin_name"]
        group_admin_email <- map["group_admin_email"]
        base_path <- map["base_path"]
        media_path <- map["media_path"]
        unread_message_count <- map["unread_message_count"]
        message <- map["message"]
        message_type <- map["message_type"]
        created_at <- map["created_at"]
        members <- map["members"]
    }

}


struct Members : Mappable,Equatable {
    var user_id : Int?
    var name : String?
    var email : String?
    var profile_pic : String?

    init?(map: Map) {

    }

    init?() {

    }
    mutating func mapping(map: Map) {

        user_id <- map["user_id"]
        name <- map["name"]
        email <- map["email"]
        profile_pic <- map["profile_pic"]
    }

}
