//
//  YHProgressHUD.swift
//  horseman
//
//  Created by 小庄 on 2019/2/11.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import SnapKit

class YHProgressHUD{
    lazy var avtive : UIActivityIndicatorView = {
        let avtive = UIActivityIndicatorView.init(style: .gray)
        
        return avtive
    }()
    
    static let progressHUD = YHProgressHUD()
    
    /// 单利方法
    class func share() -> YHProgressHUD {
        return progressHUD
    }
    
    
    
    func showLoding() {
        UIApplication.shared.windows.first?.endEditing(true)
        UIApplication.shared.windows.first?.addSubview(avtive)
                
        avtive.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        
        
        avtive.startAnimating()
    }
    
    func disMiss() {
        YHProgressHUD.share().avtive.removeFromSuperview()
    }
}
