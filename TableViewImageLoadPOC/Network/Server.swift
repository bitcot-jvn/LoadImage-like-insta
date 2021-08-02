//
//  Server.swift
//  IRIS
//
//  Created by user on 21/8/2017.
//  Copyright © Ajayy infograins. All rights reserved.
//

protocol ServerType {
    var isProduction: Bool {get}
    var hostName: String {get}
    var domain: String {get}
    var fileDirectory: String {get}
    var baseURL: String {get}
    var postURL: String {get}
    
    var path: String {get}
}

private enum DevelopmentType{
    case sandBox
    case production
}

class ServerManager {
    fileprivate var developmentType: DevelopmentType
    var clientServer: ServerType
    class var sharedManager:ServerManager{
    return ServerManager(developmentType: .sandBox, clientServer: ServerManager.createClientServerForEnviroment(.sandBox))
  // return ServerManager(developmentType: .production, clientServer: ServerManager.createClientServerForEnviroment(.production))
    }
    
    fileprivate init(developmentType: DevelopmentType, clientServer: ServerType) {
        self.developmentType = developmentType
        self.clientServer = clientServer
    }
    
    static fileprivate func createClientServerForEnviroment(_ developmentType: DevelopmentType) -> ServerType{
        let isProductionServer = (developmentType == .production) ? (true) : (false);
        let hostName =  (isProductionServer) ? (ServerConstants.clientPoductionServer.HostName) :  (ServerConstants.clientSandBoxServer.HostName)
        let domain =  (isProductionServer) ? (ServerConstants.clientPoductionServer.Domain) :  (ServerConstants.clientSandBoxServer.Domain)
        let fileDirectory = (isProductionServer) ? (ServerConstants.clientPoductionServer.fileDirectory) :  (ServerConstants.clientSandBoxServer.fileDirectory)
        let postURL  = (isProductionServer) ? (ServerConstants.clientPoductionServer.postDirectory) :  (ServerConstants.clientSandBoxServer.postDirectory)
        
        let server = Server(isProduction:isProductionServer, hostName: hostName, domain: domain,  fileDirectory: fileDirectory, postURL: postURL)
        
        return server
    }
}

struct Server: ServerType {
    var isProduction: Bool
    var hostName: String
    var domain: String
    var path: String {
        return self.baseURL + self.postURL
    }
    var fileDirectory: String
    var postURL: String
    
    var baseURL: String {
        return self.hostName
    }
}

struct ServerConstants {
    struct defaults {
        static var businessOwnerImagesfileDirectory: String{
            return "/INFO01/bingu/uploads/business_images/";
        }
    }
    
    fileprivate struct clientSandBoxServer{
        
        static  var HostName:String {
            return "https://jsonplaceholder.typicode.com/" 
        }
        
        static var Domain: String{
            return "https://jsonplaceholder.typicode.com/"
        }
        
        static var fileDirectory: String{
            return "https://jsonplaceholder.typicode.com/";
        }
        
        static var postDirectory: String{
            return ""
        }
    }
    
    struct clientPoductionServer{
        static  var HostName:String {
            return "https://talentekadmin.techopium.com/"
        }
        static  var Domain: String{
            return "https://talentekadmin.techopium.com/"
        }
        
        static var fileDirectory: String{
            return "/INFO01/bingu/uploads/owner_images/";
        }
        
        static  var webLinkBaseURL: String{
            return "https://www.mxdiamonds.com/site/"
        }
        
        static var postDirectory: String{
            return ""
        }
    }
}




