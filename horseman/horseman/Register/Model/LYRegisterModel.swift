//
//  LYRegisterModel.swift
//  horseman
//
//  Created by 小庄 on 2019/2/14.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

class LYUserModel: LYBaseModel {
    var mobile: String?
    var passwd: String?
    var status: String?
    var uid: String?
    var wx: String?
}


class LYRegisterModel: LYBaseModel {
    var user: LYUserModel?
}
