//
//  Const.swift
//  horseman
//
//  Created by 小庄 on 2019/2/13.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let ISIPHONE = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

let IS_IPHONE_X = (ISIPHONE && (CGSize(width: 375, height: 812).equalTo(CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT))))

let kStatusBarH : CGFloat = (IS_IPHONE_X ? 44 : 20)

let kNavigationBarH : CGFloat = (kStatusBarH + 44)

let kTabbarH : CGFloat = (IS_IPHONE_X ? 83 : 49)

let kBottomHeight : CGFloat = (IS_IPHONE_X ? 34 : 0)

// MARK: - 布局cell
let leftGap : CGFloat = 10.0
let rightGap : CGFloat = 10.0

let IPHONE4_DEV = "测试宏"

func GETUSERID() -> NSString {
    var userid:NSString = ""
    if UserDefaults.standard.object(forKey: "USERID") != nil {
        userid = UserDefaults.standard.object(forKey: "USERID") as! NSString
    }
    return userid
}

