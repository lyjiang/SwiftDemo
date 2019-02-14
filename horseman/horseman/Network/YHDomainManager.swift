//
//  YHDomainManager.swift
//  horseman
//
//  Created by 小庄 on 2019/1/29.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

enum domainType: Int {
    case appStore = 0
    case develop = 100
    case test = 200
    case onLine = 300
}

class YHDomainManager: NSObject {
    var baseUrl = "https://"
    var business_gc = "https://"
    var order_oc = "https://"
    var user_merchant = "https://"
    var imgsvcUrl = "https://"
    var uploadImageUrl = "https://t"
    
    //setting后续完善
    
    static let manager = YHDomainManager()
    /// 单利方法
    class func share() -> YHDomainManager {
        return manager
    }

}
