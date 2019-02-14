//
//  YHRegisterHome.swift
//  horseman
//  lydoing微信登录收不到回调
//  Created by 小庄 on 2019/2/12.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class YHRegisterHome: UIViewController, WXApiManagerDelegate {
    
    var second = 60
    var timer : Timer?
    

    private lazy var heardView : UIView = { [unowned self] in
        let topview = UIView.init()
        topview.backgroundColor = UIColor.init(hexColor: "FA6432")
        return topview
    }()
    
    private lazy var heardicon: UIImageView = { [unowned self] in
        let imageview = UIImageView.init()
        imageview.image = UIImage.init(named: "heardIcon")
        return imageview
    }()
    
    private lazy var wxBtu: UIButton = { [unowned self] in
        let btu = UIButton.init()
        btu.setTitle("微信登录", for: .normal)
        btu.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btu.addTarget(self, action: #selector(self.wxViewAction), for: .touchUpInside)
        return btu
    }()
    
    private lazy var phoneBtu: UIButton = { [unowned self] in
        let btu = UIButton.init()
        btu.setTitle("短信登录", for: .normal)
        btu.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btu.addTarget(self, action: #selector(self.phoneViewAction), for: .touchUpInside)
        return btu
    }()
    
    private lazy var trigonimage: UIImageView = { [unowned self] in
        let imageview = UIImageView.init()
        imageview.image = UIImage.init(named: "trigon_w")
        return imageview
    }()
    
    //微信登录
    private lazy var wxview: UIView = { [unowned self] in
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.isHidden = false
        return view
    }()
    
    private lazy var wxtipslabel: UILabel = { [unowned self] in
        let label = UILabel.init()
        label.text = "新用户请使用微信授权进入，开始美妙的注册之旅。"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.init(hexColor: "666666")
        return label
    }()
    
    //微信登录按钮
    private lazy var wxloginBtu: YHwxAccreditBtu = { [unowned self] in
        let btu = YHwxAccreditBtu.init()
        btu.setBackgroundImage(UIImage.init(named: "btu_bg"), for: .normal)
        btu.addTarget(self, action: #selector(self.weixinlogin), for: .touchUpInside)
        return btu
    }()
    
    //手机登录
    private lazy var phoneview: UIView = { [unowned self] in
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.isHidden = true
        return view
    }()
    
    private lazy var phonetipslabel: UILabel = { [unowned self] in
        let label = UILabel.init()
        label.text = "未注册用户使用短信登陆，我们将默认为您创建账户。"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.init(hexColor: "666666")
        return label
    }()
    
    //手机号输入
    private lazy var phoneiputview: UIView = { [unowned self] in
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hexColor: "e4e4e4").cgColor
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var phoneicon: UIImageView = { [unowned self] in
        let view = UIImageView.init()
        view.image = UIImage.init(named: "home_phone")
        return view
    }()
    
    private lazy var phonefield: UITextField = { [unowned self] in
        let field = UITextField.init()
        field.font = UIFont.boldSystemFont(ofSize: 12)
        field.clearButtonMode = .whileEditing
        field.textColor = UIColor.init(hexColor: "666666")
        field.tintColor = UIColor.init(hexColor: "666666")
        field.placeholder = "请输入手机号"
        field.keyboardType = UIKeyboardType.numberPad
        field.addTarget(self, action:  #selector(self.textFieldTextChange(_:)), for: .editingChanged)
        return field
    }()
    
    //验证码输入
    private lazy var codeiputview: UIView = { [unowned self] in
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hexColor: "e4e4e4").cgColor
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var codeicon: UIImageView = { [unowned self] in
        let view = UIImageView.init()
        view.image = UIImage.init(named: "home_pass")
        return view
    }()
    
    private lazy var codefield: UITextField = { [unowned self] in
        let field = UITextField.init()
        field.font = UIFont.boldSystemFont(ofSize: 12)
        field.clearButtonMode = .whileEditing
        field.textColor = UIColor.init(hexColor: "666666")
        field.tintColor = UIColor.init(hexColor: "666666")
        field.placeholder = "请输入手机验证码"
        field.keyboardType = UIKeyboardType.numberPad
        field.addTarget(self, action:  #selector(self.textFieldTextChange(_:)), for: .editingChanged)
        return field
    }()
    
    private lazy var getcodeBtu: UIButton = { [unowned self] in
        let btu = UIButton.init()
        btu.setTitle("获取验证码", for: .normal)
        btu.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btu.setTitleColor(UIColor.init(hexColor: "333333"), for: .normal)
        btu.layer.cornerRadius = 13
        btu.backgroundColor = UIColor.init(hexColor: "d8d8d8")
        btu.addTarget(self, action: #selector(self.getcode), for: .touchUpInside)
        return btu
    }()
    
    private lazy var phoneloginBtu: UIButton = { [unowned self] in
        let btu = UIButton.init()
        btu.setTitle("登  录", for: .normal)
        btu.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btu.setBackgroundImage(UIImage.init(named: "btu_bg"), for: .normal)
        btu.addTarget(self, action: #selector(self.codelogin), for: .touchUpInside)
        return btu
    }()
    
    private var tt: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        if tt {
        UserDefaults.standard.set("7782", forKey: "USERID")
        AppDelegate.appDelegate()?.thome()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        print("测试swift:\(GETUSERID())")
        
//        [WXApiManager sharedManager].delegate = self;
        WXApiManager.shared()?.delegate = self;
        
        self.setUI()
    }
    
    //调起微信
    func wxLoginBtnAction() {
        
//        let req = SendAuthReq.init()
//        req.scope = "snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact"
//        req.state = "0744"
//        WXApi.send(req)
        let req = SendAuthReq()
        req.scope = "snsapi_userinfo"
        req.state = "App"
        WXApi.send(req)

    }
    
    func managerDidRecvAuthResponse(response : SendAuthResp) -> NSString {
        //swift 微信授权登录一直没有回调，也没有相关资料 暂停
        return ""
    }
    
    func setUI() {
        view.addSubview(heardView)
        heardView.addSubview(heardicon)
        heardView.addSubview(wxBtu)
        heardView.addSubview(phoneBtu)
        heardView.addSubview(trigonimage)
        
        heardView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().offset(0)
            make.height.equalTo(240)
            make.top.equalTo(0)
        }
        
        heardicon.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(60)
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        
        wxBtu.snp.makeConstraints { (make) in
            make.height.equalTo(24)
            make.bottom.equalTo(-22);
            make.left.equalTo(0);
            make.right.equalTo(heardView.snp_centerXWithinMargins).offset(0)
        }
        
        phoneBtu.snp.makeConstraints { (make) in
            make.height.equalTo(24)
            make.bottom.equalTo(-22);
            make.left.equalTo(heardView.snp_centerXWithinMargins).offset(0)
            make.right.equalTo(0);
        }
        
        trigonimage.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 22, height: 14))
            make.bottom.equalTo(0)
            make.centerX.equalTo(view.snp_centerXWithinMargins).offset(-94)
        }
        
        view.addSubview(wxview)
        wxview.addSubview(wxloginBtu)
        wxview.addSubview(wxtipslabel)
        
        wxview.snp.makeConstraints { (make) in
            make.top.equalTo(240)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(0)
        }
        
        wxtipslabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(10)
            make.height.equalTo(17)
        }
        
        wxloginBtu.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(57)
            make.height.equalTo(46)
        }
        
        view.addSubview(phoneview)
        phoneview.addSubview(phonetipslabel)
        phoneview.addSubview(phoneiputview)
        phoneview.addSubview(codeiputview)
        
        phoneview.snp.makeConstraints { (make) in
            make.top.equalTo(240)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(0)
        }
        
        phonetipslabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(10)
            make.height.equalTo(17)
        }
        
        phoneiputview.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(phonetipslabel.snp_bottomMargin).offset(20)
            make.height.equalTo(46)
        }
        
        codeiputview.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(phoneiputview.snp_bottomMargin).offset(20)
            make.height.equalTo(46)
        }
        
        phoneiputview.addSubview(phoneicon)
        phoneiputview.addSubview(phonefield)
        codeiputview.addSubview(codeicon)
        codeiputview.addSubview(codefield)
        
        phoneicon.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(11)
            make.size.equalTo(CGSize.init(width: 16, height: 24))
        }

        phonefield.snp.makeConstraints { (make) in
            make.left.equalTo(phoneicon.snp_rightMargin).offset(20)
            make.bottom.equalTo(-12)
            make.height.equalTo(20)
            make.right.equalTo(-20)
        }
        
        codeicon.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(11)
            make.size.equalTo(CGSize.init(width: 16, height: 24))
        }
        
        codefield.snp.makeConstraints { (make) in
            make.left.equalTo(codeicon.snp_rightMargin).offset(20)
            make.bottom.equalTo(-12)
            make.height.equalTo(20)
            make.right.equalTo(-20)
        }
        
        phoneview.addSubview(phoneloginBtu)
        
        phoneloginBtu.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(codeiputview.snp_bottomMargin).offset(30)
            make.height.equalTo(46)
        }
        
        codeiputview.addSubview(getcodeBtu)
        getcodeBtu.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 80, height: 26))
            make.right.equalTo(-11)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func wxViewAction(){
        
        UIView.animate(withDuration: 0.5, animations: { [unowned self] in
            self.trigonimage.snp.updateConstraints { (make) in
                make.centerX.equalTo(self.view.snp_centerXWithinMargins).offset(-94)
            }
            self.view.layoutIfNeeded()
            
            self.wxview.isHidden = false
            self.phoneview.isHidden = true

        }) { (true) in

        }
        
    }
    
    @objc func phoneViewAction(){
        UIView.animate(withDuration: 0.5, animations: { [unowned self] in
            self.trigonimage.snp.updateConstraints { (make) in
                make.centerX.equalTo(self.view.snp_centerXWithinMargins).offset(94)
            }
            self.view.layoutIfNeeded()
            
            self.wxview.isHidden = true
            self.phoneview.isHidden = false
            
        }) { (true) in
            
        }
        
    }
    
    @objc func weixinlogin(){
        tt = true
        UserDefaults.standard.set("7782", forKey: "USERID")
        AppDelegate.appDelegate()?.thome()
        self.wxLoginBtnAction();

    }
    
    @objc func textFieldTextChange(_ textFiled:UITextField) {
 
        
    }
    
    //获取验证码
    @objc func getcode(_ sender:UIButton){
        var dic = [String:String]()
        dic["mobile"] = phonefield.text
        YHProgressHUD.share().showLoding()
        YHNetworkManager.postData(YHDomainManager.share().baseUrl, YHRequestPath.getCheckcode, parmas: dic, parmasJSONEncod : false, type: parmaType.parmasERPSalt, successCallback: { [unowned self] (result) in
        
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updataSecond), userInfo: nil, repeats: true)
            //调用fire()会立即启动计时器
            self.timer!.fire()
        
        }) { [unowned self](result) in

        }
    }
    
    // 3.定时操作
    @objc func updataSecond() {
        if second>1 {
            //.........
            second -= 1
            getcodeBtu.setTitle("\(second)S", for: .normal)
        }else {
            getcodeBtu.setTitle("获取验证码", for: .normal)
            stopTimer()
        }
    }
    
    // 4.停止计时
    func stopTimer() {
        if timer != nil {
            timer!.invalidate() //销毁timer
            timer = nil
        }
    }
    
    //验证码登录
    @objc func codelogin(_ sender:UIButton){
        var dic = [String:String]()
        dic["mobile"] = phonefield.text
        dic["smsCode"] = codefield.text
        
        YHProgressHUD.share().showLoding()
        YHNetworkManager.postData(YHDomainManager.share().baseUrl, YHRequestPath.codelogin, parmas: dic, parmasJSONEncod : false, type: parmaType.parmasERPSalt, successCallback: { [unowned self] (result) in
            
            let heheh = result?.value
            
            //返回数据处理方式一：原始方式 OK
//            let ddic:[NSString:Any] = result?.value as! [NSString : Any]
//            let userdic:[NSString:Any] = ddic["user"] as! [NSString : Any]
//            let uid:NSString = userdic["uid"] as! NSString
            
            //返回数据处理方式二：SwiftyJSON OK
//            let registermodel = YHRegisterModel.init(jsonData: JSON(result?.value ?? ""))
//
//            let usermodel = registermodel.usermodel
//
//            let uid:NSString = usermodel.uid as NSString
            
            
            //返回数据处理方式三：SwiftyJSON HandyJSON
            let lyregismodel = JSONDeserializer<LYRegisterModel>.deserializeFrom(dict: result?.value as? NSDictionary)

            let lyusermodel = lyregismodel?.user
            
            let uid:NSString = lyusermodel?.uid as! NSString
            
            
            UserDefaults.standard.set(uid, forKey: "USERID")
            AppDelegate.appDelegate()?.thome()
            

  
        }) { [unowned self](result) in
            
        }
        
    }

}
