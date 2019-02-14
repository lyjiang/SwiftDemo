//
//  CarViewController.swift
//  horseman
//
//  Created by 小庄 on 2019/1/25.
//  Copyright © 2019 小庄. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var rect4: Rectangle? = Rectangle(width: 200, height: 300)
        print("长方形：\(rect4!.width)XXX\(rect4!.height)") //这里就会 调用析构函数
        rect4 = nil
        // Do any additional setup after loading the view.
        
        let student = Student()
        print("学生:\(student.description())")
        
    }
    

    //struct也可以
    class Rectangle{
        var width:Double
        var height:Double
        
        init(width: Double, height: Double) {
            self.width = width
            self.height = height
        }
        
        init(W width: Double,H height: Double) {
            self.width = width
            self.height = height
        }
        
        init() {//这个方法不写的话 就要 var width:Double = 0 
            self.width = 333
            self.height = 666
        }
        
        convenience init(length: Double) {
            self.init(W: length, H: length)
        }
        
        deinit {
            print("调用析构函数。。。")
            self.width = 333
            self.height = 666
        }
    }
    
    var rect1 = Rectangle(W: 320, H: 480)
    var rect2 = Rectangle(width: 320, height: 480)
    var rect3 = Rectangle()
    
    class Person{
        var name:String
        var age:Int
        
        func description() -> String {
            return "\(name) 年龄是\(age)"
        }
        convenience init() {
            self.init(name: "Tony")
            self.age = 18//可以不要吧 这句
        }
        convenience init(name: String) {
            self.init(name: name, age: 18)
        }
        init(name:String,age:Int) {
            self.name = name
            self.age = age
        }
    }
    
    class Student: Person {
        var school: String
        init(name: String, age: Int, school: String){
            self.school = school
            super.init(name: name, age: age)
            self.toString()
            self.name = "jiang"
        }
        convenience override init(name:String,age:Int) {
            self.init(name: name, age: age, school: "清华大学")
            self.name = "ly"
        }
        
        func toString(){
            print("Student:\(school) \(name) \(age)")
        }
    }
    
    
  
}


