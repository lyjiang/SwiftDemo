//
//  UIColor-Extension.swift
//  horseman
//
//  Created by 小庄 on 2018/11/20.
//  Copyright © 2018 小庄. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 导航栏主色调
    class func navBackColor() -> UIColor {
        return UIColor.init(r: 242, g: 89, b: 108)
    }
    /// 控制器背景色
    class func vcBackColor() -> UIColor {
        return UIColor.init(hexColor: "F6F6F6")
    }
    /// 分割线
    class func separatorColor() -> UIColor {
        return UIColor.init(hexColor: "E3E3E3")
    }
    /// RGB色值标注
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat, a:CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    
    /// 随机色值
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    /// 哈希值标注
    convenience init(hexColor: String,a:CGFloat = 1.0) {
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
      
        let index0 = hexColor.index(hexColor.startIndex, offsetBy: 0)
        let index2 = hexColor.index(hexColor.startIndex, offsetBy: 2)
        let index4 = hexColor.index(hexColor.startIndex, offsetBy: 4)
        let index6 = hexColor.index(hexColor.startIndex, offsetBy: 6)
        
        Scanner(string: String(hexColor[index0..<index2])).scanHexInt32(&red)
        
        Scanner(string: String(hexColor[index2..<index4])).scanHexInt32(&green)
        
        Scanner(string: String(hexColor[index4..<index6])).scanHexInt32(&blue)
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: a)
    }
    
    
    
}


