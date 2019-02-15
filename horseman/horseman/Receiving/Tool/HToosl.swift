//
//  HToosl.swift
//  horseman
//
//  Created by 小庄 on 2019/1/4.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

class HToosl: NSObject {
    
   
     func tets(){
//        运算符重载 为了避免对后面
        var deptt = Departmenttt()
        deptt.no = 10
        deptt.name = "销售部门"

        var deptt0 = Departmenttt()
        deptt0.no = 10
        deptt0.name = "销售部门"

        if deptt == deptt {

        }
        
        
        let emp = Employee()
        print(emp.dept.name)
        print(emp.day)
        
        let friday = Employee.WeekDays.Friday
        
        if emp.day == friday{
            print("相等")
        }
        
        print(Employee.WeekDays.Day.message)
        
        
        var fdept = FDepartment()
        
        let femp1 = FEmployee()
        fdept.insertq(object:femp1, index: 0)
        
        print("你好\(fdept.femployees.count)")
    }
    
    class func daifan() -> String {
        return "你好啊"
    }
    
    class ClassA {
        fileprivate var name:String{
            return ""
        }
    }
    
    class ClassB: ClassA {
        override var name: String{
            return "LY"
        }
    }
    
    open class ClassC{
        var name:String = "Tpny"
        open func printName(){
            print(name)
        }
    }
    
    class ClassD: ClassC {
        public override func printName() {
            print(name)
        }
    }
    
}

struct Departmenttt {
    var no:Int = 0
    var name:String = ""
}

func ==(lhs:Departmenttt, rhs:Departmenttt) -> Bool{
    return lhs.name == rhs.name && lhs.no == rhs.no
}


//类型嵌套
class Employee{
    var no:Int = 0
    var name:String = ""
    var job:String?
    var salary:Double = 0
    var dept: Department = Department()
    
    var day:WeekDays = WeekDays.Friday
    
    struct Department {
        var no:Int = 10
        var name:String = "销售部"
    }

    enum WeekDays {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        
        struct Day {
            static var message: String = "Today is ..."
        }
    }
}

//13.2可变方法
class FEmployee{
    var no:Int = 0
    var name:String = ""
    var job:String?
    var salary:Double = 0
    var dept: FDepartment = FDepartment()
}

struct FDepartment {
    var no: Int = 0
    var name: String = ""
    
    var femployees: [FEmployee] = [FEmployee]()
    //mutating  申明方法可变
    mutating func insertq(object: AnyObject, index: Int) -> () {
        let emp = object as! FEmployee
        femployees.insert(emp, at: index)
    }
    
}











