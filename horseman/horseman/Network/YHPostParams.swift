//
//  YHPostParams.swift
//  horseman
//
//  Created by 小庄 on 2019/2/11.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import SwiftyJSON
enum parmaType {
    //加密
    case parmasERPSalt // --- 默认
    
}

//先只做基本的网络请求，后续完善
class YHPostParams: NSObject {
    static let ERP_SYC_KEY = "nK!test"
    
    /// get请求基本参数
    class func baseGetParmas(_ data : [String : Any]?) -> String {
        var url = ""
        url = "http://"
        return url
    }
    
    class func postParams(_ dic:[String:Any] = [String:Any](),type:parmaType = parmaType.parmasERPSalt) -> [String:Any] {
        return YHPostParams.chooseRequestPlantWithJava()
    }
    
    private class func chooseRequestPlantWithJava(_ dic:[String:Any] = [String:Any]()) -> [String:Any]{
        var params = [String:Any]()
        params["appplt"] = "iph"
       
        return params
    }
    
}
