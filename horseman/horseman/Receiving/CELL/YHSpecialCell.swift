//
//  YHSpecialCell.swift
//  horseman
//
//  Created by 小庄 on 2019/2/15.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
import AlamofireImage

class YHSpecialCell: UITableViewCell {
    
    private lazy var bgview:UIView = { [unowned self] in
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 4
        return view
        }()
    
    private lazy var logoImageview:UIImageView = { [unowned self] in
        let imageview = UIImageView.init()
        imageview.image = UIImage.init(named: "login_icon")
        imageview.layer.cornerRadius = 15
        imageview.layer.masksToBounds = true
        return imageview
        }()
    
    private lazy var brandnamelabel:UILabel = { [unowned self] in
        let label = UILabel.init()
        label.text = "高端床品合集"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(hexColor: "333333")
        return label
        }()
    
    private lazy var attentionBtu:UIButton = { [unowned self] in
        let btu = UIButton.init()
        btu.backgroundColor = UIColor.init(hexColor: "e96d68")
        btu.setTitle("关注", for: .normal)
        btu.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btu.layer.borderWidth = 1
        btu.layer.borderColor = UIColor.init(hexColor: "ededed").cgColor
        btu.layer.cornerRadius = 15
        btu.addTarget(self, action: #selector(attention), for: .touchUpInside)
        return btu
        }()
    
    private lazy var contentlabel:UILabel = { [unowned self] in
        let label = UILabel.init()
        label.text = "网罗全球高端床品，只为让你睡得更舒服。品牌包括但不限于：NHK.NC-home,xiaoqhu，TRSK等"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.init(hexColor: "333333")
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
        }()
    
    private lazy var contentImageview:UIImageView = { [unowned self] in
        let imageview = UIImageView.init()
        imageview.contentMode = UIView.ContentMode.scaleToFill
        imageview.image = UIImage.init(named: "bannerdefault")
        return imageview
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.init(hexColor: "f2f2f2")
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.initUI()
        
    }
    
    @objc func initUI(){
        self.addSubview(bgview)
        bgview.addSubview(logoImageview)
        bgview.addSubview(brandnamelabel)
        bgview.addSubview(attentionBtu)
        bgview.addSubview(contentlabel)
        bgview.addSubview(contentImageview)
        
        bgview.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(5)
            make.bottom.equalTo(-15)
        }
        
        logoImageview.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 30, height: 30))
            make.left.top.equalTo(10)
        }
        
        brandnamelabel.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.equalTo(logoImageview.snp_rightMargin).offset(10)
            make.top.equalTo(15)
        }
        
        attentionBtu.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 80, height: 30))
            make.right.equalTo(-10)
            make.top.equalTo(10)
        }
        
        contentlabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageview.snp_bottomMargin).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        contentImageview.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(contentlabel.snp_bottomMargin).offset(10)
            make.height.equalTo(200)
            make.bottom.equalTo(-15)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func drawUI(dic:NSDictionary){
        //        let productmodel = JSONDeserializer<LYProductlistItem>.deserializeFrom(dict: dic as? NSDictionary)
        
        let productmodel = JSONDeserializer<LYProductlistItem>.deserializeFrom(dict: dic)
        
        self.brandnamelabel.text = productmodel?.brandNameCN
        self.contentlabel.text = productmodel?.activityContent
        
        
        let imaurl: String! = productmodel?.brandLogo
        let baseurl: String! = (YH_BASE_IMG_URL as NSString) as String
        print("打印图片地址\(String(describing: baseurl))\(String(describing: imaurl))")
        
        //        let url = URL(string: "\(String(describing: baseurl))\(String(describing: imaurl))")!
        
        let url = URL(string: baseurl+imaurl)
        
        self.logoImageview.af_setImage(withURL: url!)
        
        let bimaurl: String! = productmodel?.activityPicture
        let bbaseurl: String! = YH_BASE_IMG_URL
        //        print("打印图片地址\(bbaseurl)\(bimaurl)")
        
        let burl = URL(string: bbaseurl+bimaurl)
        self.contentImageview.af_setImage(withURL: burl!)
    }
    
    @objc func attention(sender:UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("NOtest"), object: self, userInfo: ["post":"原来是你"])
    }
    
}

