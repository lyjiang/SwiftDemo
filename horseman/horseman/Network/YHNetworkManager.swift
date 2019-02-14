//
//  YHNetworkManager.swift
//  horseman
//
//  Created by 小庄 on 2019/2/11.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct YHResult {
    var message = ""
    var response: YHResponse?
    var value : Any?
    
    init(_ message : String = "", _ response : YHResponse? = nil) {
        self.message = message
        self.response = response
        self.value = response?.data
    }
}

enum MethodType{
    case get
    case post
    case delete
    case put
}

class YHNetworkManager{

    /// get请求方法
    ///
    /// - Parameters:
    ///   - domain: 请求域名
    ///   - path: 请求路径
    ///   - parmas: 请求参数（不包括）
    ///   - type: 参数是否加密  ,默认加密
    ///   - successCallback: 成功回调
    ///   - failueCallback: 失败回调
    
    class func getData(_ domain : String, _ path : YHRequestPath,_ lastUrl : String = "",parmas : [String:Any]? = nil,type : parmaType = .parmasERPSalt,successCallback :  @escaping (_ result : YHResult?) -> (),failueCallback :  @escaping (_ result : YHResult?) -> ()) {
        
        let url = domain + path.rawValue + lastUrl
        
        YHNetworkManager.requestGet(url: url, successCallback: successCallback, failueCallback: failueCallback)
        
        
    }
    
    /// post请求方法
    ///
    /// - Parameters:
    ///   - domain: 请求域名
    ///   - path: 请求路径
    ///   - parmas: 请求参数（不包括）
    ///   - type: 参数是否加密  ,默认加密
    ///   - successCallback: 成功回调
    ///   - failueCallback: 失败回调
    class func postData(_ domain : String, _ path : YHRequestPath, parmas : [String:Any], parmasJSONEncod:Bool = false,  type : parmaType = .parmasERPSalt,successCallback :  @escaping (_ result : YHResult?) -> (),failueCallback :  @escaping (_ result : YHResult?) -> ()) {
        
        if parmasJSONEncod  {

            YHNetworkManager.requestPostEncoding(url: domain + path.rawValue, parameters: parmas, successCallback: successCallback, failueCallback: failueCallback)

        }else{
            YHNetworkManager.requestPost(url: domain + path.rawValue, parameters: parmas, successCallback: successCallback, failueCallback: failueCallback)
            
        }
    }
    
    
    private class func requestGet(url: String, successCallback : @escaping(_ result : YHResult?) -> (),failueCallback : @escaping(_ result : YHResult?) -> ()){
        let utilityQueue = DispatchQueue.global(qos: .utility)
        Alamofire.request(url, method: .get).responseJSON(queue: utilityQueue) { (response) in
            YHNetworkManager.severDataBlock(response, successCallback: successCallback, failueCallback: failueCallback)
        }
    }
    
    private class func requestPostEncoding(url : String,parameters : [String : Any]? = nil, successCallback :  @escaping (_ result : YHResult?) -> (),failueCallback :  @escaping (_ result : YHResult?) -> ()) {
        let utilityQueue = DispatchQueue.global(qos: .utility)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(queue: utilityQueue) { (response) in
            YHNetworkManager.severDataBlock(response, successCallback: successCallback, failueCallback: failueCallback)
        }
    }
    
    private class func requestPost(url : String,parameters : [String : Any]? = nil, successCallback :  @escaping (_ result : YHResult?) -> (),failueCallback :  @escaping (_ result : YHResult?) -> ()) {
        let utilityQueue = DispatchQueue.global(qos: .utility)
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON(queue: utilityQueue) { (response) in
            YHNetworkManager.severDataBlock(response, successCallback: successCallback, failueCallback: failueCallback)
        }
    }
    
    private class func severDataBlock(_ response: DataResponse<Any>,successCallback :  @escaping (_ result : YHResult?) -> (),failueCallback :  @escaping (_ result : YHResult?) -> ()) {
        DispatchQueue.main.async() {
            YHProgressHUD.share().disMiss()
            guard let result = response.result.value else {
                failueCallback(YHResult.init("请求失败，请稍后重试", nil))
                return
            }
            guard let jsonDic = JSON.init(result).dictionaryObject else {
//                DLog("jsonError")
                failueCallback(YHResult.init("jsonError", nil))
                return
            }

            let res = YHResponse.init(jsonData: JSON.init(jsonDic))

            print("打印code\(res.code)")
            
            /// 处理网络请求成功逻辑
            if res.code==0 {
                successCallback(YHResult.init("",res))
            }else{
                failueCallback(YHResult.init(res.message, res))
            }
        }
    }
}


class YHResponse{
    var code = 0
    var message = ""
    
    var additional : Any?
    var data : Any?
    var errMsg = JSON()

    init(jsonData: JSON) {

        errMsg = jsonData["errMsg"]
        code = errMsg["code"].intValue
        message = errMsg["msg"].stringValue
        data = jsonData["data"].object
    }
}
