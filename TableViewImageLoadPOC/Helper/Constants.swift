//
//  Constants.swift
//  Speed Shopper
//
//  Created by mac on 11/04/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
    static let getPushNotification = Notification.Name(
        rawValue: "getPushNotification")
    static let getPushNotificationFromAppKilled = Notification.Name(
        rawValue: "getPushNotificationAppKilled")
    static let getChat = Notification.Name(
        rawValue: "getChat")
}

struct LikeStatus {
    static let kLike = "1"
    static let kUnlike = "0"
}

struct notificationName {
    static let successpayment =  "successpayment"
    static let notify =  "notify"
    static let chatGroupSingle = "chatGroupSingle"
    static let changeImage = "kkchangeImage"
    static let jobUpdate = "kkjobUpdate"
}

struct DocumentDetail {
    static let docName =  "kkkdocName"
    static let docSize =  "kkkdocSize"
}

struct PageOption {
    //["Pages you follow","Discover","Invitations","My Pages"]
    static let kPages_you_follow = "Pages you follow"
    static let kDiscover = "Discover"
    static let kInvitations = "Invitations"
    static let kMy_Pages = "My Pages"
}

struct typeOfSendIs {
    static let post_verify = "0"
    static let endorsement = "1"
    static let future_ratings = "2"
}

struct WingsColor {
    static let white = "white"
    static let yellow = "yellow"
    static let blue = "blue"
    static let greeen = "greeen"
}
//Optional (0 = All, 1 = Friends, 2 = Mentors, 3 = Colleagues, 4 = Managers, 5 = Teachers, 6 = Connection Request)

struct FriendCategory {
    static let AllConnection = "0"
    static let Connection_Requests = "6"
    static let Friend = "1"
    static let Mentor = "2"
    static let Colleagues = "3"
    static let Managers = "4"
    static let Teachers = "5"
    static let currentCity = "7"
}

struct groupType {
    static let GroupRequested = "Invitations"
    static let MyGroup = "My Groups"
    static let Public = "Public"
    static let Private = "Private"
    static let Leave = "Leave"
    static let Delete = "Delete"
    static let Accept = "Accept"
    static let Reject = "Decline"
}

struct NotificationCount {
    static let value = "kkkBadgecount"
}

struct privacyOfGroup {
    static let ispublic = "1"
    static let isPrivate = "2"
}

struct is_requestGroup {
    //"request_response" = "0 - Not Sent, 1 - Sent, 2 - Joined, 3 - Rejected";
    static let kNot_Sent = 0
    static let kSent = 1
    static let kJoined = 2
    static let kRejected = 3
}

struct DraftPost {
    static let kdelete = "9"
    static let kEdit = "10"
}

struct  GroupCategory {
   // y = ["Home","About","Media","Jobs","Events"]
    static let kHome = "Home"
    static let kAbout = "About"
    static let kMedia = "Media"
    static let kJobs = "Jobs"
    static let kEvents = "Events"
    static let kRequest = "Request"
    static let ksettings = "Settings"
    static let kMessaging = "Messaging"
    static let kNotifications = "Notifications"
}



struct rememberMeKey {
    static let kemail = "====kemail==="
    static let kpassword = "====kpassword==="
}

struct chatType {
    static let privateChat =  "privateChat"
    static let groupChat =  "groupChat"
    static let eventChat =  "eventChat"
    
    static let text = "text"
    static let video = "video"
    static let image = "image"
    static let chat_type_group = "2"
    static let chat_type_private = "1"
    static let viewProfile =  "kkviewProfile"
    static let delete =  "kkdeleteMember"

}

struct improveMuPostTitle {
    static let skills = "What skills did you develop?"
    static let verify = "Who can verify this post"
    static let Endorsement = "Invite Endorsement"
    static let Ratings = "Skills of the Future Ratings"
}

struct MainClass {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    static let Home = UIStoryboard(name: "Home", bundle: .main)
    static let Friend = UIStoryboard(name: "Friend", bundle: .main)
    static let Page = UIStoryboard(name: "Page", bundle: .main)
    static let Group = UIStoryboard(name: "Group", bundle: .main)
    static let Chat = UIStoryboard(name: "Chat", bundle: .main)
    
    static let webService = Apimanager.sharedManager
    
}

struct jobParameter {
    static let JobTitle = "kkjobtitle"
    static let companyName = "kkcompanyName"
    static let location = "kkLocation"
    static let EmployeType = "kkEmployeType"
    static let discription = "kkdiscription"
    static let Jobskillls =  "kkJobskillls"
    static let ReciveApplicantsBy = "kkReciveApplicantsBy"
    static let url = "kkUrl"
    
}

struct ChatGroupParameter {
    static let imageGroup = "kkkimageGroup"
    static let NameGroup = "kkkNameGroup"
    static let groupId = "kkkgroupId"
    static let groupMembers = "kkkkgroupMembers"
}



struct SceneClass {
    static let mySceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate//self.view.window.windowScene.delegate//shared.delegate as! AppDelegate
}
struct loginType {
    static let student = "student"
    static let teacher = "teacher"
    static let principle = "principle"
    static let district = "district"
}

struct summeryRedirectionUrl {
    static let kwebview_growings = "webview-growings"
    static let kwebview_user_profile = "webview-user-profile"
    static let kwebview_message = "webview-message"
    static let kwebview_post_detail = "webview-post-detail"
    static let kwebview_achievement = "webview-achievement"
    
}

struct NotificationType {
}

struct MessageUsersKey {
    static let kFromId = "from_id"
    static let kToId = "to_id"
    var isOpenChat : Bool?
    var fromId : String?
    var toId : String?
    var propertyId : String?
}

struct DeleteOrEditJob{
    static let Edit = "editjob"
    static let Delete = "DeleteJob"
    static let addAdmin = "addAdmin"
    static let pageDelete = "pageDelete"
}

struct statusOfLink {
    static let link = "0" //"No Request Sent"
    static let Accepted = "1" //1 = "Request Accepted";
    static let Request = "2" //2 = "Sender (Requested by you)";
    static let Accept = "3" //3 = "Receiver (Requested by someone)";
    
}

struct EventType {
    static let kUpcoming = "upcoming"
    static let kpast = "past"
    static let kEventEdit = "EventEdit"
    static let kEventdelete = "Eventdelete"
    static let kEventAttendingYes = "EventAttendingYes"
}

struct UseCaseMessage {
    static let commingSoon = "kcommingSoon".localized
    struct Message {
        
    }
 
    struct Empty {
        static let phoeOrEmail = "*Please enter Email/Phone"
        
        static let required = "*Required"
        static let email = "*Please enter email"
        static let password = "*Please enter password"
        static let Number = "*Please enter number"
        static let selectcode = "*Please select country code"
        static let confirmPasswod = "*Please enter confirm password"
    }
    struct InValid {
       static let validemail = "*Please enter valid email"
        static let validNumber = "*Please enter valid number"
       static let validPaasword = "*Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character"
        static let validUrl = "*Enter Valid URL"
    }
    struct Alert {
          static let notMatch = "*Password not match"
           
       }
    
    
    struct NotAvailable {
        static let camera = "kNAcamera"
        static let gallery = "kNAgallery"
    }
}

struct AppColor {
    static let blueColor = "2D2884"
    static let PinkDark = "85298f"
    static let PinkLight = "00000"
    static let gray = "AAAAAA"
    static let YellowLight = "F23BA2"
}

struct genderStr {
    static let male = "male"
    static let female = "female"
    static let other = "other"
}
struct UserType {
    //    1=seller/buyer,2=investor,3=agent,4=SP,5=renter
    
    static let buyerSeller = "1"
    static let investor = "2"
    static let agent = "3"
    static let ServiceProvider = "4"
    static let Renter = "5"
}

struct HeaderKey {
    //static let x_api_key = "x-api-key"
    
    static let x_api_key = "apikey"
//    static let valXApiKey = "7!4#8%4&5(1"
    static let valXApiKey = "GX5tODpychclT5eaPTlTaunjItVntepAkuf"
    static let token = "Authorization"
    static let bearer = "Bearer"
    static let guest = "guest"
    static let accept = "Accept"
    static let appJson = "application/json"
    static let appLang = "Accept-Language"
    static let contentType = "Content-Type"
    
    struct appLanguage {
        //en - english or nl - dutch or he - hebrew or fr - french
        static let English = "en"
        static let Spanish = "es"
        static let French = "fr"
        static let Hebrew = "he"
        static let Dutch = "nl"
        static let Russian = "ru"
    }
}

struct ErrorMessage {
    static let parser = "kError_parser".localized
    static let internet = "kError_internet".localized
}
struct base {
    static let imgUrl = "https://talentekadmin.techopium.com/"
   // static let imgUrl = "http://192.168.2.130/talentek/admin/"
}
struct baseSocektChatUrl {
    //static let baseUrl = "http://192.168.2.85:3719"// Sandbox //http://192.168.2.85:3719/api/v1/
    static let baseUrl = "https://www.techopium.com:3719" //Production
}

struct baseImageUrlChat {
   // static let imgUrl = "http://192.168.2.143/cam_school_chat"// Sandbox
    static let imgUrl = "https://www.techopium.com/cam-school"// production
}

struct chatServerURL {
   // static let chatProduction = "http://192.168.2.85:3719/api/v1/"//"http://192.168.2.87:3800/api/v1/"// sandBox
    static let chatProduction = "https://www.techopium.com:3719/api/v1/"// production https://www.techopium.com:3719
}

struct SummeryUrl {
    //static let DOMAIN_SUMMARY_URL = "http://192.168.2.130:4200/webview-summary/?"
    static let DOMAIN_SUMMARY_URL = "https://talentek.techopium.com/webview-summary/?"
}

struct nottification_Type {
    static let group_request = "group_request"
    static let group_invite = "group_invite"
    static let group_post_like = "group_post_like"
    static let group_post_comment = "group_post_comment"
    
    static let post_comment = "post_comment"
    static let post_like = "post_like"
    static let post_share = "post_share"
    
    static let page_invite = "page_invite"
    static let page_admin = "page_admin"
    static let page_following = "page_following"
    static let page_post_like = "page_post_like"
    static let page_post_comment = "page_post_comment"
    
    static let post_verification_request = "post_verification_request"
    static let readiness_request = "readiness_request"
    static let endorsement_request = "endorsement_request"
    static let post_verified = "post_verified"
    static let link_request_accepted = "link_request_accepted"
    static let link_request_sent = "link_request_sent"
    static let kpayment_success = "payment_success"
    

}
struct postType {
    static let VolunteerExperience = "1"
    static let WorkExperience = "2"
    static let Projects = "3"
    static let Achievements = "4"
    static let FormalLearning = "5"
    static let Health = "6"
    static let Hobbies = "7"
    static let learnMore = "8"
}

struct ImportantTitle {
    static let yes = "Yes".localized
    static let no = "No".localized
}

struct webUrls {
    static let privacy = "https://talentek.techopium.com/policies"//"https://talentek.techopium.com/privacy-policy"
    static let webStdio = "https://talentek.techopium.com/webview-what-is-wing-studio"
}

struct SocialType {
    static let fb = "facebook"
    static let google = "google"
}


struct DocumentUploadType {
//    image/doc/pdf
    static let image = "image"
    static let doc = "doc"
    static let pdf = "pdf"
}

struct PaymentAmount {
    static let kServiceProvider = "35"
}

struct EditPosts {
    static let NormalPost = "kkkNormalPostEdit"
    static let GroupPost = "kkkGroupPostEdit"
    static let PagePost = "kkkPagePostEdit"
}

struct ImportantKeys {
    static let google_map_key = "AIzaSyAKvycSSOCZc0MmqmBXyCw15sfVO0zGKKM"
    static let google_client_key = "923160663750-53n359s2haesn7sklnpiprplmpjuiptf.apps.googleusercontent.com"
    static let stripe_test_key = "pk_test_tJd5BjSyeJTi5FgDXdWjUFVn"
    static let stripe_live_key = ""
    static let paypalSandbx = "AeUScknip4uH0vfLCnA85z5a19mhG7w4hnWR3Z83urfjlUNkNAmM1h1IVbfVCu0IFyzwigG7BSU54Xkf"
    struct PlaidCredential {
        static let ClientID = "5c6b9018af8902001097bb7b"
        static let PublicKey = "c7e73b88e85e01272c26f4ad2682f0"
        static let DevelopmentKey = "a2b27e8ce5fae71023000fb9e9bb3c"
        static let SandBox = "2d217d941e0791068220984b996473"
    }
}

struct ProjectStatus{
//    0 = pedning, 1 = awarded, 2 = accepted/running, 3 = completed, 4 = rejected
    static let pending = "0"
    static let awarded = "1"
    static let running_accepted = "2"
    static let completed = "3"
    static let rejected = "4"
}

class CurrentUser {
    static var shared: CurrentUser{
        struct wrapper {
            static let shared = CurrentUser()
        }
        return wrapper.shared
    }
    
    var userType = ""
}

struct Constants {
    struct AppPrefrencesConstants{
        static var CurrentLanguageKey: String {
            return "__k__current_language"
        }
        
        struct AppLanguage {
            struct Code {
                static var English: String {
                    return "en"
                }
                static var Arabic: String {
                    return "ar"
                }
            }
            struct Title {
                static var English: String {
                    return "English"
                }
                static var Arabic: String {
                    return "Arbic"
                }
            }
        }
    }
    
    struct Localized{
        static let LocalizedFileKey = "Localizable"
    }
    

}

enum SocialLoginType: String {
    case google
    case facebook
    case apple
    case email
}

struct EmptyMessage {
    static let name = "Please enter name"
    static let number = "Please enter mobile number"
    static let email = "Please enter email"
    static let seed = "Please enter seed phrase"
    static let password = "Please enter password"
    static let passcode = "Please enter passcode"
    static let confirmpasscode = "Please enter confirm passcode"
    static let confirmPassword = "Please enter confirm password"
    static let BtcAddres = "Please enter BTC address"
    static let Amount = "Please enter amount"
    
    static let oldPasscode = "Please enter old Passcode"
    static let NewPasscode = "Please enter new Passcode"
   
}

struct  validCredential {
    static let validEmail = "Please enter valid email"
    static let validPassword = "Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character"
    static let ValidConfirmPassword = "Password not match"
    static let ValidConfirmPasscode = "passcode not match"
    static let validContactNumber = "Mobile number should be minimum 7 digit, maximum 14 digit"
    static let validPasscode = "Passcode should be 4 digit"
}


enum viewController:String {
    case PassCodeVC
    case LoginVC
    case BTCExchangeVC
    case PaymentDetailVC
    case SetPasscodeVC
    case passCodeVC
    case ForgotPasswordVC
    case SignUpVC
    case SendBitCoinVC
    case TransectionListVC
    case ReceiveBTCVC
    case QRCodeScanerVC
    case QRCodeGenraterVC
}

enum currnecy:String{
    case BTC
    case ETH
    
    func getCurrency() -> String{
        switch self {
        case .BTC:
            return "BTC"
        case .ETH:
            return "ETH"
        }
        
    }
}
