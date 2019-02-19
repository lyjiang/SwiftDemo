//
//  YHHotVC.swift
//  horseman
//
//  Created by 小庄 on 2019/2/15.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class YHHotVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    private lazy var productlist:NSArray = []
    
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
        
        
        
        lytableview.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(-49)
        }
        
        self.getproductlist()
        
    }
    
    //datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productlist.count
    }
    
    //这个好像没作用啊。一直是1
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:YHSpecialCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? YHSpecialCell
        if cell==nil {
            cell = YHSpecialCell(style: .subtitle, reuseIdentifier: cellid)
            cell?.drawUI(dic: self.productlist[indexPath.row] as! NSDictionary)
        }
        
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
        var dic = [String:String]()
        dic["flag"] = "1"
        dic["currPage"] = "1"
        dic["count"] = "20"
        
        YHProgressHUD.share().showLoding()
        YHNetworkManager.postData(YHDomainManager.share().baseUrl, YHRequestPath.productlist, parmas: dic, parmasJSONEncod : false, type: parmaType.parmasERPSalt, successCallback: { [unowned self] (result) in
            
            let lylistmodel = JSONDeserializer<LYProductlistModel>.deserializeFrom(dict: result?.value as? NSDictionary)
            self.productlist = lylistmodel?.data ?? []
            
            self.lytableview.reloadData()
            
        }) { [unowned self](result) in
            
        }
    }
    
    
    
    
}
