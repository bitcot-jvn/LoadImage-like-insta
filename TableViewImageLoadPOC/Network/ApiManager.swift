//
//  ApiManager.swift
//  Speed Shopper
//
//  Created by mac on 13/04/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire


protocol WebServiceDelegate {
    func success_serverResponse(data: Any, actionStr : String)
    func failure_serverResponse(data: Any, actionStr : String)
}


class Apimanager {
    var webServiceDelegate : WebServiceDelegate?
    static var sharedManager: Apimanager{
        struct wrapper {
            static let sharedManager = Apimanager()
        }
        return wrapper.sharedManager
    }
    
    lazy fileprivate var useDefaults : UserDefaults = {
        return UserDefaults.standard
    }()
    
    
    func callApiPostMethod(str_Action: String! , param : [String:Any]){
       
        var path = ServerManager.sharedManager.clientServer.path
            path += str_Action
        let request = NetworkRequestResource(path: path, method: .post, param: param)
        Network.networkRequest(request) { (resultState) in
            switch resultState{
            case .success(let baseModel):
                self.webServiceDelegate?.success_serverResponse(data: baseModel, actionStr: str_Action)
                break
            case .failure(let baseModel):
                self.webServiceDelegate?.failure_serverResponse(data: baseModel, actionStr: str_Action)
                break
            }
        }
    }
    
    func callApiPostMethodWithoutParam(str_Action: String!){
        var path = ServerManager.sharedManager.clientServer.path
        path += str_Action
        let param = [String: String]()
        let request = NetworkRequestResource(path: path, method: .post, param: param)
        Network.networkRequest(request) { (resultState) in
            switch resultState{
            case .success(let baseModel):
                self.webServiceDelegate?.success_serverResponse(data: baseModel, actionStr: str_Action)
                break
            case .failure(let baseModel):
                self.webServiceDelegate?.failure_serverResponse(data: baseModel, actionStr: str_Action)
                break
            }
        }
    }
    
    func callApiGetMethod(str_Action: String!){
        var path = ServerManager.sharedManager.clientServer.path
        path += str_Action
        let param = [String: String]()
        let request = NetworkRequestResource(path: path, method: .get, param: param)
        Network.networkRequest(request) { (resultState) in
            switch resultState{
            case .success(let baseModel):
                self.webServiceDelegate?.success_serverResponse(data: baseModel, actionStr: str_Action)
                break
            case .failure(let baseModel):
                self.webServiceDelegate?.failure_serverResponse(data: baseModel, actionStr: str_Action)
                break
            }
        }
    }
    
    func callApiForUpload(dataDict: [String:Any], action:String!){
          var path = ServerManager.sharedManager.clientServer.path
            path += action
         //let param = [String: String]()
         let request = NetworkRequestResource(path: path, method: .post, param: dataDict)
        Network.uploadPhoto(request){
            (resultState) in
            switch resultState {
            case .success(let baseModel):
                self.webServiceDelegate?.success_serverResponse(data: baseModel, actionStr: action)
                break
            case .failure(let error):
                self.webServiceDelegate?.failure_serverResponse(data: error, actionStr: action)
                break
            }
        }
    }

}
