//
//  HMMineVC.swift
//  horseman
//
//  Created by 小庄 on 2018/11/20.
//  Copyright © 2018 小庄. All rights reserved.
//

import UIKit
import Foundation

class HMMineVC: UIViewController {

    private lazy var loginoutbtu : UIButton = { [unowned self] in
        let btu = UIButton.init()
        btu.setTitle("退出登录", for: .normal)
        btu.backgroundColor = UIColor.red
        btu.addTarget(self, action:  #selector(self.loginoutAction(_:)), for: .touchUpInside)
        return btu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
//        let dic = ["mobile":"13611733439"]
//        YHProgressHUD.share().showLoding()
//        YHNetworkManager.postData(YHDomainManager.share().baseUrl, YHRequestPath.getCheckcode, parmas: dic, parmasJSONEncod : false, type: parmaType.parmasERPSalt, successCallback: { [unowned self] (result) in
//
//            let str = self.chenageUI()
//            print("daying \(str)")
//
//        }) { [unowned self](result) in
//            let str = self.chenageUI()
//            print("daying \(str)")
//            //            self.viewController()?.showMessege(result?.messege)
//        }
        
        view.addSubview(loginoutbtu)
        loginoutbtu.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 100, height: 38))
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        
        // Do any additional setup after loading the view.
        
        //运算符重载 为了避免对后面
        var deptt = Departmentt()
        deptt.no = 10
        deptt.name = "销售部门"
        
        var deptt0 = Departmentt()
        deptt0.no = 10
        deptt0.name = "销售部门"
        
        if deptt == deptt {
            
        }
        
        let emp = HMEmployee()
        print(emp.fullName)
        
        emp.fullName = "Tom.Guan"
        print(emp.fullName)
        
        let car = Car();
        print(car.fullName)
        
        let day = WeekDays.Monday
        print(day.message)
        
        let suv = Suv()
        suv.no = 100
        suv.name = "Smith"
        
        var zhipao = Zhipao()
        zhipao.no = 30
        
        
        //访问静态属性
        print(Account.staticProp)
        
        var myAccount = Account()
        //访问实例属性
        myAccount.amount = 1_000_000
        //访问实例属性
        print(myAccount.instanceProp)
        
        
        print(Bccount.staticProp)
        
        let myBccount = Bccount.中国工商银行
        //访问实例实例
        print(myBccount.instanceProp)
        
        
        print(Cccont.staticProp)
        
        let myCount = Cccont()
        
        myCount.amount = 1_000_000
        print(myCount.instanceProp)
        
        
        //访问静态属性
        print(Cccont.staticProp)
        
        let myCccount = Cccont()
        //访问实例属性
        myCccount.amount = 1_000_000
        //访问静态属性
        print(myCccount.instanceProp)
        
        //输出二维数组
        let COL_NUM = 10
        let ROW_NUM = 10
        
        var ary2 = DoubleDumensionalArray(rows: ROW_NUM, columns: COL_NUM)
        
        for i in 0 ..< ROW_NUM{
            for j in 0 ..< COL_NUM{
                print("\t \(ary2[i,j])",terminator: "")
            }
            print("\n")
        }
        
        //调用静态方法
        print(SAccount.interestBy(amount: 10_000.000))
        let mySaccount = SAccount()
        //调用实例方法
        print(mySaccount.messageWith(amount: 10_000.00))
        
        //调用静态方法
        print(SBccount.interestBy(amount: 10_000.00))
        
        //这块有点 书本184页
        FccountA.interestBy(rate: 1)
        FccountB.interestBy(rate: 1)
        FccountA().interestWithRate1(rate: 3)
        
        
        
    }
    
    //退出登录
    @objc func loginoutAction(_ sender:UIButton) {
        UserDefaults.standard.removeObject(forKey: "USERID")
        AppDelegate.appDelegate()?.tregis()
    }
    
    
    func chenageUI() -> NSString {
        return "11"
    }
}

//延迟存储属性
class School{
    var no:Int = 0
    var name:String = ""
    var job:String?
    var salary:Double = 0
    lazy var dept: Student = Student()
}

struct Student {
    var no:Int = 0
    var name:String = ""
}



struct Departmentt {
    var no:Int = 0
    var name:String = ""
}

func ==(lhs:Departmentt, rhs:Departmentt) -> Bool{
    return lhs.name == rhs.name && lhs.no == rhs.no
}

//计算属性
class HMEmployee{
    var no: Int = 0
    var firstName:String = "Tony"
    var lastName:String = "Guan"
    var job:String?
    var salary:Double = 0
    lazy var depe:Departmentt = Departmentt()
    
    var fullName:String{
        get {
            return firstName + "." + lastName
        }
        set (newFullName) {
            var name = newFullName.components(separatedBy: ".")
            firstName = name[0]
            lastName = name[1]
        }
    }
}


//结构体和枚举中的计算属性
struct Car {
    var no:Int = 0
    var name:String = "威朗"
    
    var fullName:String{
        return "这是一辆" + name + "车"
    }
}

enum WeekDays: String {
    case Monday     = "Mon."
    case Tuesday    = "Tue."
    case Wednesday  = "Wed."
    case Thursday   = "Thu."
    case Friday     = "Fri."
    
    var message: String{
        return "Today is " + self.rawValue
    }
}


class Suv{
    var no:Int = 0
    var name:String = "Tony"{
        willSet(newNameValue){
            print("员工name新值:\(newNameValue)")
        }
        didSet(oldNameValue){
            print("员工name旧值:\(oldNameValue)")
        }
//        willSet{//也可以这么来
//            print(newValue)
//        }
    }
    var job:String?
    var salary:Double = 0
    var dept:Zhipao?
}

struct Zhipao {
    var no:Int = 10{
        willSet{
            print("部门编号新值:\(newValue)")
        }
        didSet{
            print("部门编号旧值:\(oldValue)")
        }
    }
    var name:String = "RESEARCH"
    static let price:Int = 166000
}

//静态属性 又称类型属性
//结构体静态属性
struct Account {
    var amount:Double = 0.0
    var owner:String = ""
    
    static var interestRate:Double = 0.0668
    
    static var staticProp:Double{
        return interestRate * 1_000_000
    }
    
    var instanceProp:Double{
        return Account.interestRate * amount
    }
}

//结构体静态方法
struct SAccount {
    var owner:String = "Tony"
    static var interestRate:Double = 0.0668
    
    static func interestBy(amount: Double) -> Double{
        print(self)
        return interestRate * amount
    }
    
    func messageWith(amount: Double) -> String {
        let interest = SAccount.interestBy(amount: amount)
        return "\(self.owner)的利息是\(interest)"
    }
}

//枚举静态属性
enum Bccount{
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    static var interestRate: Double = 0.0668
    
    static var staticProp:Double{
        return interestRate * 1_000_000
    }
    
    var instanceProp: Double{
        switch(self){
        case .中国银行:
            Bccount.interestRate  = 0.0667
        case .中国工商银行:
            Bccount.interestRate  = 0.0669
        case .中国建设银行:
            Bccount.interestRate  = 0.0666
        case .中国农业银行:
            Bccount.interestRate  = 0.0668
        }
        return Bccount.interestRate*1_000_000
    }
}

enum SBccount{
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    static var interestRate: Double = 0.0668
    
    static func interestBy(amount: Double) ->Double {
        return interestRate * amount
    }
}

//类静态属性
class Cccont {
    //账户金额
    var amount: Double = 0.0
    var owner: String = ""
    static var interestRate:Double = 0.0668
    
    //class换成static不能重写该属性
    class var staticProp: Double {
        return interestRate * 1_000_000
    }
    
    var instanceProp: Double{
        return Cccont.interestRate * self.amount
    }
}

class CccontB: Cccont {
     class var instanceProp: Double{
        return interestRate * 1_000_000
    }
}

//二维数组
struct DoubleDumensionalArray {
    let rows:Int,columns:Int
    
    var grid:[Int]
    init(rows:Int, columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    
    subscript(row:Int,col:Int) -> Int{
        get{
//            print("row\(row)col\(col)")
//            return grid[(row * col) + col]
            return row * col
        }
        
        set(newValue1){
            grid[(row * col) + col] = newValue1
        }
    }
}

struct FAccount {
    var amount:Double = 10_000.0
    var owner:String = "Tony"
    //计算利息
    func interestWithRate(rate: Double) -> Double {
        return rate * amount
    }
}

class FccountA {
    var amount:Double = 10_000.0
    var owner:String = "Tony"
    //计算利息
    class func interestBy(rate: Double) -> Double {
        return rate * 1110.01
    }
     func interestWithRate1(rate: Double) -> Double {
        return rate * amount
    }
}

class FccountB: FccountA{
    //计算利息
    override static func interestBy(rate: Double) -> Double {
        return rate * 0.01
    }
}




