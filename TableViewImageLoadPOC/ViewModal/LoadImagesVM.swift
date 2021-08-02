//
//  LoadImagesVM.swift
//  TableViewImageLoadPOC
//
//  Created by BitCot Technologies on 31/07/21.
//

import Foundation
import UIKit
import ObjectMapper


class LoadImagesVM: NSObject {
  
    // MARK: Variables
    var vc: LoadeImagesVC?
    var arrData: [CollectionModal] = []{
        didSet{
            DispatchQueue.main.async {
                self.vc?.tblImagesLoader?.reloadData()
            }
        }
    }
    
    override init() {
        super.init()
        vc = LoadeImagesVC()
        self.CallApiForLoadData()
    }

}

//CallServer for response
extension LoadImagesVM:WebServiceDelegate{
    //CallApi
    func CallApiForLoadData(){
        Apimanager.sharedManager.webServiceDelegate = self
        Apimanager.sharedManager.callApiGetMethod(str_Action: ApiConstant.ApiAction.kPhotos)
    }
    
    func success_serverResponse(data: Any, actionStr: String) {
        if actionStr == ApiConstant.ApiAction.kPhotos{
            guard let baseModel = Mapper<CollectionModal>().mapArray(JSONObject: data)else {
                return
            }
            self.arrData = baseModel
        }
    }
    
    func failure_serverResponse(data: Any, actionStr: String) {
        vc!.showServerErrorMessage(data: data)
    }
    
}

