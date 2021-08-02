//
//  Network.swift
//  Speed Shopper
//
//  Created by mac on 13/04/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import SystemConfiguration
import Alamofire
import UIKit



protocol NetworkRequestResourceType {
    var path: String {get}
    var method: Alamofire.HTTPMethod {get}
    var param: [String: Any] {get}
    var url:URL{get}
}

struct NetworkRequestResource: NetworkRequestResourceType {
    var path: String
    var method: Alamofire.HTTPMethod
    var param: [String : Any]
    var url:URL{
        return URL(string: self.path)!
    }
}

extension UIView{
    
    func getHUD(spinner:UIActivityIndicatorView) -> UIView{
        let window = SceneClass.mySceneDelegate?.window
        window?.resignFirstResponder()
        let view = UIView(frame: CGRect(x: 0, y: 200, width: Int(UIScreen.main.bounds.width), height: Int(UIScreen.main.bounds.height)))//UIView(frame: UIScreen.main.bounds )
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.center = (window?.rootViewController?.view.center ?? CGPoint())
        spinner.center = view.center
        spinner.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        spinner.startAnimating()
        view.addSubview(spinner)
        window?.addSubview(view)
        return view
    }
}

class Network {
    
    class func networkRequest(_ resource:NetworkRequestResourceType , compilation: @escaping (Result<Any, NSError>) -> Void){
        self.log(resource:resource)
        Network.dataTask(path: resource.url, method: resource.method, param: resource.param) {
            compilation($0)
        }
    }
    
    static fileprivate let kTimeOutInterval:Double = 150
    static fileprivate var sharedAlamofire:Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = kTimeOutInterval
        configuration.timeoutIntervalForRequest =  kTimeOutInterval
        let alamoFireManager = Session(configuration: configuration)
        return alamoFireManager
        
    }()
    
    
    
    final class func dataTask(path: URL, method: HTTPMethod, param : Dictionary<String,Any>, complitionBlock:@escaping(_ result: Result<Any, NSError>) -> Void){
        
        if !Connectivity.isConnectedToInternet {
            let customError = NSError(domain: "Network", code: 67, userInfo: [NSLocalizedDescriptionKey : "No Internet Connection available"])
            let alert = UIAlertController(title: Utils.AppName(), message: customError.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (altAction) in
            }))
            SceneClass.mySceneDelegate?.window?.rootViewController?.present(alert, animated: true)
            return
        }
        print(path.lastPathComponent)
        var hudView = UIView()
        
        hudView = UIView().getHUD(spinner: UIActivityIndicatorView())
       
        
        let dic =  [HeaderKey.x_api_key:HeaderKey.valXApiKey]
        let headers = HTTPHeaders(dic)
        //MARK: For rowdata response
//        var request  = URLRequest(url: path)
//        request.httpMethod = method.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer \(SharedPreference.jwtToken())", forHTTPHeaderField: "Authorization")
//        if method.rawValue != "GET"{
//            do {
//                request.httpBody   = try JSONSerialization.data(withJSONObject: param)
//            } catch let error {
//                print("Error : \(error.localizedDescription)")
//            }
//
//        }
       
       
//        self.sharedAlamofire.request(request).responseJSON { (response: DataResponse) in
        self.sharedAlamofire.request(path, method: method, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { (response: DataResponse) in
            switch(response.result){
            case .success(let JSON):
                let str = String(data: response.data ?? Data(), encoding: .utf8)
                print(str?.data(using: .utf8)?.prettyPrintedJSONString ?? NSString())
                hudView.removeFromSuperview()
//                guard let httpResponse = response.response else {
//                    return
//                }
                
//                if httpResponse.statusCode == 403 {
//                    let _ = (JSON as? NSDictionary)?.value(forKey: "error") as? String
////                    let alert = UIAlertController(title: Utils.AppName(), message: message, preferredStyle: .alert)
////                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (altAction) in
////                        SharedPreference.clearUserData()
////                        let newViewController = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
////                        let navigationController = UINavigationController(rootViewController: newViewController)
////                        SceneClass.mySceneDelegate?.window?.rootViewController =  navigationController
////                    }))
////                    SceneClass.mySceneDelegate?.window?.rootViewController?.present(alert, animated: true, completion: {
////
////                    })
//                }else{
                    complitionBlock(.success(JSON))
//                }
                break
            case .failure(let error):
                let customError = NSError(domain: "Network", code: 67, userInfo: [NSLocalizedDescriptionKey : error.localizedDescription]);
                complitionBlock(.failure(customError))
                hudView.removeFromSuperview()
                
                break
            }
        }
    }
    
    static func log(resource: NetworkRequestResourceType) {
        let greeting = "\n\n*********************************************\n\n"
        var debugString = greeting;
        
        debugString += (resource.path  + resource.param.apiDebug)
        debugString += greeting
        print("\n\n==============NetworkRequest===============:\(debugString)\n\n")
    }
    
    class func uploadPhoto(_ resource: NetworkRequestResourceType, compilationBlock: @escaping (_ result: Result<Any, NSError>) -> Void) {
        self.log(resource:resource)
        
        if !Connectivity.isConnectedToInternet {
            let customError = NSError(domain: "Network", code: 67, userInfo: [NSLocalizedDescriptionKey : "No internet connection available"]);
            compilationBlock(.failure(customError))
            return
        }
        let hudView = UIView().getHUD(spinner: UIActivityIndicatorView())
        var headers = [String : String]()
        headers[HeaderKey.x_api_key] = HeaderKey.valXApiKey
        let httpHeaders = HTTPHeaders(headers)
        AF.upload(multipartFormData: { multipartFormData in
            for  (key, value) in resource.param{
                if value is URL{
                    let url = value as! URL
                    multipartFormData.append(url, withName: key)
                }else if value is Array<URL>{
                    let values = value as! Array<URL>
                    for val in values{
                        let url = val
                        multipartFormData.append(url, withName: key)
                    }
                }else {
                    multipartFormData.append((value as AnyObject).data!(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
        }, to: resource.url, method: .post, headers: httpHeaders) .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON(completionHandler: { data in
            print("upload finished: \(data)")
            switch data.result{
            case .success(let json):
                hudView.removeFromSuperview()
               // let status = (json as? NSDictionary)?.value(forKey: "status") as? String
                //                print(status ?? "")
                compilationBlock(.success(json))
                print("upload success result: \(String(describing: json))")
            case .failure(let err):
                hudView.removeFromSuperview()
                let customError = NSError(domain: "Network", code: 67, userInfo: [NSLocalizedDescriptionKey : err.localizedDescription]);
                compilationBlock(.failure(customError))
                
                print("upload err: \(err)")
            }
            
        })
        
    }
    
   
    class func downloadImage(_ urlString:String, compilation:@escaping (_ result: Data) -> Void){
        self.sharedAlamofire.request(self.urlRequest(urlString) as! URLRequestConvertible).response(completionHandler: { (response) in
            guard let data = response.data else {return}
            compilation(data)
            
        })
    }
    
    class func urlRequest(_ urlString:String) -> NSMutableURLRequest {
        return NSMutableURLRequest(url: URL(string: urlString)!, cachePolicy: .returnCacheDataElseLoad , timeoutInterval: kTimeOutInterval)
    }
    
    
    
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}


