//
//  YHSpecialVC.swift
//  horseman
//
//  Created by 小庄 on 2019/2/15.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

class YHSpecialVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(hexColor: "f2f2f2")
        
        let tableview = UITableView.init(frame: view.bounds, style: .plain)
        tableview.backgroundColor = UIColor.init(hexColor: "f2f2f2")
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview.estimatedRowHeight = 200
        tableview.rowHeight = UITableView.automaticDimension//自使用高度
        
        tableview.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(-49)
        }
        
    }
    
    //datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:YHSpecialCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? YHSpecialCell
        if cell==nil {
            cell = YHSpecialCell(style: .subtitle, reuseIdentifier: cellid)
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
    
    


}
