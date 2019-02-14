//
//  HMHomeVC.swift
//  horseman
//
//  Created by 小庄 on 2018/11/20.
//  Copyright © 2018 小庄. All rights reserved.
//

import UIKit

class HMHomeVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
 
        tabBar.tintColor = UIColor.init(hexColor: "e96d68") //tabbar 字体颜色
        tabBar.barTintColor = UIColor.white //tabbar 背景颜色
        
        self.addChildVC(childVC: HMReceivVC(), childTitle: "商品", imageName: "home_tabbar", selectedImageName: "home_tabbared")
        self.addChildVC(childVC: CarViewController(), childTitle: "购物车", imageName: "mine_tabbar", selectedImageName: "mine_tabbared")
        self.addChildVC(childVC: HMMineVC(), childTitle: "个人中心", imageName: "mine_tabbar", selectedImageName: "mine_tabbared")
  
    }
    
    /// 添加子控制器
    private func addChildVC(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName:String)
    {
        let navigation = UINavigationController(rootViewController: childVC)
        navigation.navigationBar.tintColor = UIColor.white //item 字体颜色
        navigation.navigationBar.barTintColor = UIColor.init(hexColor: "e96d68") //背景颜色
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        navigation.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : Any]
        childVC.title = childTitle
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChild(navigation)
    }
    
}
