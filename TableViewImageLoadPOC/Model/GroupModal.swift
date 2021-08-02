//
//  GroupModal.swift
//  Talent Tech
//
//  Created by Hyperbeans on 09/01/21.
//  Copyright © 2021 Hyperbeans. All rights reserved.
//

import Foundation
import ObjectMapper

class GroupModal : Mappable,Equatable {
    static func == (lhs: GroupModal, rhs: GroupModal) -> Bool {
        return true
    }
    
    var user_id : String?
    var group_id : String?
    var fullname : String?
    var gender : String?
    var profile_pic : String?
    var post_id : String?
    var post_description : String?
    var media : [Media]?
    var likes : String?
    var comments : String?
    var created : String?
    var like_status : Int?
    var comment : [String]?
    var reported : String?
   
    var group_name : String?
    var group_description : String?
    var privacy : String?
    var location : String?
    var profile_image : String?
    var cover_image : String?
    var followers : String?
    var is_request :Int?
    var is_admin:Int?


    required init?(map: Map) {

    }
    
    init?() {

    }

    func mapping(map: Map) {

        user_id <- map["user_id"]
        group_id <- map["group_id"]
        fullname <- map["fullname"]
        gender <- map["gender"]
        profile_pic <- map["profile_pic"]
        post_id <- map["post_id"]
        post_description <- map["post_description"]
        media <- map["media"]
        likes <- map["likes"]
        comments <- map["comments"]
        created <- map["created"]
        like_status <- map["like_status"]
        comment <- map["comment"]
        reported <- map["reported"]
       
        group_name <- map["group_name"]
        group_description <- map["group_description"]
        privacy <- map["privacy"]
        location <- map["location"]
        profile_image <- map["profile_image"]
        cover_image <- map["cover_image"]
        followers <- map["followers"]
        is_request <- map["is_request"]
        is_admin    <- map["is_admin"]
    }

}




class Media : Mappable,Equatable {
    static func == (lhs: Media, rhs: Media) -> Bool {
        return true
    }
    
    var key : String?
    var value : String?
    var thumb : String?
    var file_type : String?
    var image_url :String?
    var name :String?
    var size:String?
    

    required init?(map: Map) {
    }
    init?() {

    }

    func mapping(map: Map) {
        name <- map["name"]
        size <- map["size"]
        key <- map["key"]
        value <- map["value"]
        thumb <- map["thumb"]
        file_type <- map["file_type"]
        image_url <- map["image_url"]
    }

}


struct AboutUsModal : Mappable {
    var group_id : String?
    var user_id : String?
    var group_name : String?
    var group_description : String?
    var privacy : String?
    var profile_image : String?
    var cover_image : String?
    var followers : String?
    var created : String?
    var profile_pic : String?
    var fullname : String?
    var country_name : String?
    var state_name : String?
    var city_name : String?
    var is_admin : Int?
    var is_owner : Int?
    var is_request : Int?
    var request_response : String?
    var member_list : [Member_list]?
    var show_more : Int?
    var more_count : Int?

    init?(map: Map) {

    }
    init?() {

    }

    mutating func mapping(map: Map) {

        group_id <- map["group_id"]
        user_id <- map["user_id"]
        group_name <- map["group_name"]
        group_description <- map["group_description"]
        privacy <- map["privacy"]
        profile_image <- map["profile_image"]
        cover_image <- map["cover_image"]
        followers <- map["followers"]
        created <- map["created"]
        profile_pic <- map["profile_pic"]
        fullname <- map["fullname"]
        country_name <- map["country_name"]
        state_name <- map["state_name"]
        city_name <- map["city_name"]
        is_admin <- map["is_admin"]
        is_owner <- map["is_owner"]
        is_request <- map["is_request"]
        request_response <- map["request_response"]
        member_list <- map["member_list"]
        show_more <- map["show_more"]
        more_count <- map["more_count"]
    }

}

struct Member_list : Mappable {
    var member_id : String?
    var user_id : String?
    var group_id : String?
    var is_admin : String?
    var is_owner : String?
    var fullname : String?
    var profile_pic : String?

    init?(map: Map) {}
    init?() {}

    mutating func mapping(map: Map) {

        member_id <- map["member_id"]
        user_id <- map["user_id"]
        group_id <- map["group_id"]
        is_admin <- map["is_admin"]
        is_owner <- map["is_owner"]
        fullname <- map["fullname"]
        profile_pic <- map["profile_pic"]
    }

}

struct GroupmediaModal : Mappable {
    var image_id : String?
    var group_id : String?
    var user_id : String?
    var post_id : String?
    var media_type : String?
    var media : String?
    var thumb : String?
    var size: String?
    var name: String?

    init?(map: Map) {

    }
    init?() {}

    mutating func mapping(map: Map) {
        size    <- map ["size"]
        name    <- map["name"]
        image_id <- map["image_id"]
        group_id <- map["group_id"]
        user_id <- map["user_id"]
        post_id <- map["post_id"]
        media_type <- map["media_type"]
        media <- map["media"]
        thumb <- map["thumb"]
    }

}
