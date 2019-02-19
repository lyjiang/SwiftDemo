//
//  YHSpecialVC.swift
//  horseman
//
//  Created by 小庄 on 2019/2/15.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class YHSpecialVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    private lazy var productlist:NSMutableArray = []
    
    private lazy var page:Int = 1;
    
    private lazy var bgview:UIView = { [unowned self] in
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 4
        return view
        }()
    
    private lazy var lytableview:UITableView = { [unowned self] in
        let tableview = UITableView.init(frame: view.bounds, style: .plain)
        tableview.backgroundColor = UIColor.init(hexColor: "f2f2f2")
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview.estimatedRowHeight = 200
        tableview.rowHeight = UITableView.automaticDimension//自使用高度
        return tableview
        
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(hexColor: "f2f2f2")
        
        view.addSubview(lytableview)
        
        let header = MJRefreshNormalHeader()
        header.setRefreshingTarget(self, refreshingAction: #selector(self.refreshHeader))
        self.lytableview.mj_header = header
        
        let footer = MJRefreshBackGifFooter()
        footer.setRefreshingTarget(self, refreshingAction: #selector(self.refreshFooter))
        self.lytableview.mj_footer = footer
        
        lytableview.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(-49)
        }
        
        self.getproductlist()
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue:"isTest"), object: nil)
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(nofunnc), name: NSNotification.Name(rawValue: "NOtest"), object: nil)
    }
    
    @objc func nofunnc(nofi : Notification){
        print("咦，谁发通知给我了")
        let str = nofi.userInfo!["post"]
        print("你好我是" + String(describing: str!))
    }
    
    deinit {
        //移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func refreshHeader(){
        print("下拉刷新")
        self.getproductlist()
        
    }
    
    @objc func refreshFooter(){
        print("上啦加载更多")
        
        var dic = [String:String]()
        dic["flag"] = "3"
        dic["currPage"] = "1"
        //        dic["currPage"] = "\(self.page++)"
        dic["count"] = "20"
        
        //        var nstring = String(stringInterpolationSegment: self.page) int转string
        
        YHProgressHUD.share().showLoding()
        YHNetworkManager.postData(YHDomainManager.share().baseUrl, YHRequestPath.productlist, parmas: dic, parmasJSONEncod : false, type: parmaType.parmasERPSalt, successCallback: { [unowned self] (result) in
            
            let lylistmodel = JSONDeserializer<LYProductlistModel>.deserializeFrom(dict: result?.value as? NSDictionary)
            
            self.productlist.addObjects(from: lylistmodel?.data as! [Any])
            
            self.lytableview.reloadData()
            self.lytableview.mj_footer.endRefreshing()
            
        }) { [unowned self](result) in
            self.lytableview.mj_footer.endRefreshing()
            
        }
        
    }
    
    
    //datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productlist.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:YHSpecialCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? YHSpecialCell
        if cell==nil {
            cell = YHSpecialCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.drawUI(dic: self.productlist[indexPath.row] as! NSDictionary)
        return cell!
    }
    
    //delegate
    //设置高度
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 320.0
    //    }
    //选中cell后执行的方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    //查询特卖列表
    @objc func getproductlist(){
        self.page = 1
        self.productlist = NSMutableArray.init()
        var dic = [String:String]()
        dic["flag"] = "3"
        dic["currPage"] = "\(self.page)"
        dic["count"] = "20"
        
        //        var nstring = String(stringInterpolationSegment: self.page) int转string
        
        YHProgressHUD.share().showLoding()
        YHNetworkManager.postData(YHDomainManager.share().baseUrl, YHRequestPath.productlist, parmas: dic, parmasJSONEncod : false, type: parmaType.parmasERPSalt, successCallback: { [unowned self] (result) in
            //
            let lylistmodel = JSONDeserializer<LYProductlistModel>.deserializeFrom(dict: result?.value as? NSDictionary)
            //            self.productlist = lylistmodel?.data ?? [] as! NSArray
            self.productlist.addObjects(from: lylistmodel?.data as! [Any])
            self.lytableview.reloadData()
            self.lytableview.mj_header.endRefreshing()
        }) { [unowned self](result) in
            self.lytableview.mj_header.endRefreshing()
            
        }
    }
    
    
    
    
}
