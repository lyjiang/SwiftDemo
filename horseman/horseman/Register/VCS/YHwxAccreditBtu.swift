//
//  YHwxAccreditBtu.swift
//  horseman
//
//  Created by 小庄 on 2019/2/12.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

class YHwxAccreditBtu: UIButton {
    private lazy var contentview : UIView = { [unowned self] in
        let view = UIView.init()
        view.isUserInteractionEnabled = false
        return view
    }()

    private lazy var bimageview: UIImageView = { [unowned self] in
        let imageview = UIImageView.init()
        imageview.image = UIImage.init(named: "home_weixin")
        return imageview
    }()

    private lazy var btitle: UILabel = { [unowned self] in
        let label = UILabel.init()
        label.text = "微信授权登录"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }

    //swift中规定:重写控件的init(frame方法)或者init()方法.必须重写 init?(coder aDecoder: NSCoder)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(contentview)
        contentview.addSubview(bimageview)
        contentview.addSubview(btitle)
        
        contentview.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.height.centerX.equalToSuperview()
        }
        
        bimageview.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize.init(width: 30, height: 24))
        }
        
        btitle.snp.makeConstraints { (make) in
            make.left.equalTo(bimageview.snp_rightMargin).offset(20)
            make.height.centerY.equalTo(self)
            make.right.equalTo(0)
        }
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        //titleLabel ,imageView中间的空隙宽度
//        let spaceWid = CGFloat(5)
//        //btn的宽度
//        let btnWid = frame.size.width
//        //titleLabel ,imageView的总宽度 加 空隙
//        let wid = titleLabel!.frame.size.width + imageView!.frame.size.width + spaceWid
//
//        titleLabel!.frame.origin.x = (btnWid-wid)*0.5
//        imageView!.frame.origin.x = titleLabel!.frame.maxX + spaceWid
//
//    }
    
}
