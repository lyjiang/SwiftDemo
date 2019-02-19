//
//  YHProductHomeVC.swift
//  horseman
//
//  Created by 小庄 on 2019/2/15.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

class YHProductHomeVC: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    ///懒加载一个page
    private lazy var pageViewControllerMain:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    //数组
    private lazy var dataSouceControll = [UIViewController]()
    //获取索引
    private lazy var nextIndex : Int = 0
    //创建上面的滚动条
    private lazy var scrollerView : UIScrollView = UIScrollView()
    
    //子控制器1
    private lazy var pageFirst : UIViewController = YHSpecialVC()
    //子控制器2
    private lazy var pageTwo : UIViewController = YHHotVC()
    //子控制器3
    private lazy var pageThree : UIViewController = YHSpecialVC()
    //子控制器4
    private lazy var pagefouer : UIViewController = YHHotVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //创建UI
        createPageUI()
        
    }
    
    func createPageUI() {
        
        pageViewControllerMain.view.frame = CGRect(x: 0, y: 64+33, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-33)
        pageViewControllerMain.delegate = self
        pageViewControllerMain.dataSource = self
        addChild(pageViewControllerMain)
        view.addSubview(pageViewControllerMain.view)
        pageViewControllerMain.didMove(toParent: self)
        
        //添加字控制器
        dataSouceControll += [pageFirst,pageTwo,pageThree,pagefouer]
        
        //   UIPageViewControllerNavigationDirection调用了此方法切换Controller的动画可以为从左往右和从右往左两种，如果animated属性设置为NO，则这个属性无效。是枚举类型，定义了以下两种通过此方法跳转的翻页方式。
        //从左往右（或从下往上）：UIPageViewControllerNavigationDirectionForward;
        //从左往右（或从下往上）： UIPageViewControllerNavigationDirectionReverse;
        //设置默认显示控制器
        pageViewControllerMain.setViewControllers([pageFirst], direction:.forward, animated: false, completion: nil)
        view.gestureRecognizers = pageViewControllerMain.gestureRecognizers
        
        ///MARK--创建标题栏部分
        scrollerView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 33)
        scrollerView.showsVerticalScrollIndicator = false
        scrollerView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollerView)
        //设置滚动视图尺寸
        scrollerView.contentSize = CGSize(width: SCREEN_WIDTH, height: 33)
        
        //设置滚动标题
        let arrayTitle = ["特卖","热播","预告","推荐"]
        for i in 0..<self.dataSouceControll.count {
            let button = UIButton()
            button.frame = CGRect(x: 0.0 + SCREEN_WIDTH/CGFloat(self.dataSouceControll.count) * CGFloat(i), y: 0, width: SCREEN_WIDTH/CGFloat(self.dataSouceControll.count), height: 33)
            button.setTitle(arrayTitle[i], for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.tag = i+1
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.red, for: .selected)
            button.addTarget(self, action: #selector(ActionButotn), for: .touchUpInside)
            scrollerView.addSubview(button)
            
            //标题下划线
            let imgageLine = UIImageView()
            imgageLine.frame = CGRect(x: 0.0 + SCREEN_WIDTH/CGFloat(self.dataSouceControll.count) * CGFloat(i), y: 31, width:SCREEN_WIDTH/CGFloat(self.dataSouceControll.count), height: 2)
            imgageLine.backgroundColor = UIColor.red
            imgageLine.tag = i+100
            imgageLine.isHidden = true
            scrollerView.addSubview(imgageLine)
            
            if i==0 {
                
                button.isSelected = true
                imgageLine.isHidden = false
            }
            
        }
    }
    
    //标题点击事件
    @objc func ActionButotn(button:UIButton) {
        
        //找到所有buton
        for i in 0..<self.dataSouceControll.count {
            let buttonAll = view.viewWithTag(i+1) as? UIButton
            
            let imageLine = view.viewWithTag(i+100) as? UIImageView
            
            if buttonAll?.tag == button.tag {
                print(buttonAll?.tag ?? "没有找到button" )
                buttonAll?.isSelected = true
                imageLine?.isHidden = false
            }else{
                buttonAll?.isSelected = false
                imageLine?.isHidden = true
            }
            
        }
        
        //控制器改变，设置显示控制器
        pageViewControllerMain.setViewControllers([self.dataSouceControll[button.tag-1]], direction:.forward, animated: false, completion: nil)
        
        
    }
    
    ///MARK---UIPageViewController代理方法--------
    //往左边滑动翻页会走此方法（类似pop回来）
    //    这两个方法的使用很相似, 都是根据当前的控制器, 获取当前控制器的索引, 然后修改索引(加1或者减1)来获取下一个控制器, 并返回;
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        
        let index = self.dataSouceControll.index(of: viewController)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        //守护，防止空值在解包时崩溃
        guard let index1 = index else {
            return nil
        }
        // 此处index必须减一
        return dataSouceControll[index1 - 1]
    }
    
    
    //往左边滑动翻页会走此方法（类似push下去）
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        //获取当前控制器索引
        let index = self.dataSouceControll.index(of: viewController)
        
        if index == NSNotFound {
            return nil
        }
        
        if (index == self.dataSouceControll.count-1) {
            //防止越界,必须要设置
            return nil
        }
        //守护，防止空值在解包时崩溃
        guard let index1 = index else {
            return nil
        }
        
        return dataSouceControll[index1+1]
    }
    
    //   取消pageControl，想要取消白点显示，只要不设定以下dataSource方法即可。
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.dataSouceControll.count
    }
    //跟页码有关
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
    //    下面一个问题,就是如何获取下一个控制器的索引, 在上面两个数据源方法里无法获取准确的索引, 而应该在下面这个方法里获取:
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let controller = pendingViewControllers[0]
        self.nextIndex = self.dataSouceControll.index(of: controller)!
    }
    
    //还有一个非常有用的代理，它在动画执行完毕后被调用，在controller切换完成后，我们可以在这个代理中进行一些后续操作。例如用UIPageViewController实现轮播分页等功能。
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            
            print(self.nextIndex)
            
            //找到所有buton
            for i in 0..<self.dataSouceControll.count {
                let buttonAll = view.viewWithTag(i+1) as? UIButton
                let imageLine = view.viewWithTag(i+100) as? UIImageView
                if i == self.nextIndex {
                    buttonAll?.isSelected = true
                    imageLine?.isHidden = false
                }else{
                    buttonAll?.isSelected = false
                    imageLine?.isHidden = true
                }
                
            }
            
        }
    }
    
    //视图将要出现的时候执行
    override func viewWillAppear(_ animated: Bool) {
        print("将要出现")
        //影藏导航栏
        //        self.navigationController?.isNavigationBarHidden = true
        
    }
    //视图将要消失的时候执行
    override func viewWillDisappear(_ animated: Bool) {
        print("将要消失")
        
    }
    
    //    Swift里面舍弃了OC的dealloc方法，经过笔者多方查阅资料下面方法可以替代dealloc方法
    deinit {
        
        print("走了dealloc")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
