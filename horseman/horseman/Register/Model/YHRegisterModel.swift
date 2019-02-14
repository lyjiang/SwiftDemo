//
//  YHRegisterModel.swift
//  horseman
//
//  Created by 小庄 on 2019/2/14.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import SwiftyJSON

class YHRegisterModel{
    var dealermodel:DealerMOdel
    var usermodel:UserMOdel
    var dealerRolemodel:DealerRoleModel
    
    init(jsonData: JSON) {
        dealermodel = DealerMOdel.init(jsonData: jsonData["dealer"])
        usermodel = UserMOdel.init(jsonData: jsonData["user"])
        dealerRolemodel = DealerRoleModel.init(jsonData: jsonData["dealerRole"])
    }
}

//经销商
class DealerMOdel{
    var code = ""
    var dealerLevelId = ""
    var dealerRoleId = ""
    var invitationCode = ""
    var parentId = ""
    var shortName = ""
    var status = ""
    var uid = ""
    var userId = ""
    
    init(jsonData: JSON) {
        code = jsonData["code"].stringValue
        dealerLevelId = jsonData["dealerLevelId"].stringValue
        dealerRoleId = jsonData["dealerRoleId"].stringValue
        invitationCode = jsonData["invitationCode"].stringValue
        parentId = jsonData["parentId"].stringValue
        shortName = jsonData["shortName"].stringValue
        status = jsonData["status"].stringValue
        uid = jsonData["uid"].stringValue
        userId = jsonData["userId"].stringValue
    }
}

//用户信息
class UserMOdel{
    var mobile = ""
    var passwd = ""
    var status = ""
    var uid = ""
    var wx = ""
    
    init(jsonData: JSON) {
        mobile = jsonData["mobile"].stringValue
        passwd = jsonData["passwd"].stringValue
        status = jsonData["status"].stringValue
        uid = jsonData["uid"].stringValue
        wx = jsonData["wx"].stringValue
    }
}

//角色
class DealerRoleModel{
    var uid = ""
    var code = ""
    var name = ""
    
    init(jsonData: JSON) {
        uid = jsonData["uid"].stringValue
        code = jsonData["code"].stringValue
        name = jsonData["name"].stringValue
    }
}

//示例
class ALYUserInfoModel {
    
    var shop_id = ""
    var mp = ""
    var is_delete = 0
    var token = ""
    var account_id = ""
    
    init(jsonData: JSON) {
        
        shop_id    = jsonData["build_name"].stringValue
        account_id    = jsonData["account_id"].stringValue
        mp = jsonData["mp"].stringValue
        is_delete  = jsonData["is_delete"].intValue
        token      = jsonData["token"].stringValue
    }
}
