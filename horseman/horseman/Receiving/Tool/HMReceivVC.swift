//
//  HMReceivVC.swift
//  horseman
//
//  Created by 小庄 on 2018/11/20.
//  Copyright © 2018 小庄. All rights reserved.
//

import UIKit

class HMReceivVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        

        
        
        var a = 12;
        print(-a);
        
        a += 1
        print(a);
        
        
        var doubleResult = 10.0
        print(doubleResult)
        
        doubleResult = doubleResult + 8
        
        doubleResult =  doubleResult.truncatingRemainder(dividingBy: 7) //double 类型取余数 int类型 直接用%
        
        print(doubleResult)
        
        let value1 = 1
        let value2 = 2
        if value1 != value2 {
            print(value1 == value2)
            print(value1 == value2)
        }
        
        let mmin = Int.min
        let mmax = Int.max
        let mm = 3.36e2
        print(mmin)
        print(mmax)
        print(mm)
        
        let historyScore: UInt8 = 90;
        let englishScore: UInt16 = 130;
        
        let totalScorce = UInt16(historyScore) + englishScore;
        
        print(totalScorce)
        
        let is🐎 = true;
        
        if (is🐎) {
            print("是的，它是马")
        }else{
          
        }
        
        var n1:Int?=10;
        n1 = nil
        
        let str:String!=nil
        
        let andSign1: Character = "&"
        let andSing2: Character = "\u{26}"
        let simel: Character = "😄"
        
        
        var mstr = "Objective and Swift"
        print("原始字符串：\(mstr)")
        
        mstr.insert("你", at: mstr.endIndex)
        print("插入后字符串:\(mstr)")
        
        mstr.remove(at: mstr.index(before: mstr.endIndex))
        print("删除后字符串:\(mstr)")
        
        var startIndex = mstr.startIndex
        var endIndex = mstr.index(startIndex, offsetBy: 9)
        var range = startIndex...endIndex
        
        mstr.removeSubrange(range)
        print("删除范围后:\(mstr)")
        
        startIndex = mstr.startIndex
        endIndex = mstr.index(startIndex, offsetBy: 0);
        range = startIndex...endIndex
        
        mstr.replaceSubrange(range, with: "C++")
        print("替换范围后：\(mstr)")
        
        
        
        let docFolder = [
        "java.docx",
        "JavaBean.docx",
        "Objective-c.xlsx",
        "Swift.docx"
        ]
        
        var wordDocCount = 0
        for doc in docFolder {
            if doc.hasSuffix(".dox"){
                wordDocCount += 1
            }
        }
        
        
        print("文件夹中Word文档个数：\(wordDocCount)")
        
        var jacaDocCount = 0
        for doc in docFolder {
            let lowercaseDoc = doc.lowercased()
            if lowercaseDoc.hasPrefix("java"){
                jacaDocCount += 1
            }
        }
        
        print("文件夹中Word文档个数：\(jacaDocCount)")
        
        for i in 1..<10{
            print("\(i)X\(i)=\(i*i)")
        }
        
        let numbers = [1,2,3,4,5,6,7,8,9,10]
        
        for (index,element) in numbers.enumerated() {
            print("Item \(index):\(element)")
        }
        
        let bolg1 = Blog(name: "小鱼", URL: "www", Author: "ly")
        
        guardStyleBlog(bloa: bolg1)
        
        
        var studentList:[String] = ["张三","李四","王五"]
        print(studentList)
        
        studentList.append("董六")
        print(studentList)
        
        studentList += ["刘备","关羽"]
        print(studentList)
        
        studentList.insert("张飞", at: studentList.count)
        print(studentList)
        
        let removestudent = studentList.remove(at: 0);
        print(removestudent)
        print(studentList)
        
        studentList[0] = "诸葛亮"
        print(studentList)
        
        for item in studentList {
            print(item)
        }
        
        for (index,value) in studentList.enumerated() {
            print("Item\(index + 1):\(value)")
        }
        
        var studentDicctionary = [102:"张三",105:"李四",109:"王五"]
        studentDicctionary[110] = "董六"
        
        print("班级人数:\(studentDicctionary.count)")
        
        let dismissStudent = studentDicctionary.removeValue(forKey: 102)
        print("开除的学生：\(dismissStudent!)")
        
        studentDicctionary[105] = nil
        studentDicctionary[109] = "张三"
        
        let replceStudent = studentDicctionary.updateValue("周八", forKey: 110)
        print("被替换的学生是:\(replceStudent!)")
        
        var testdic = ["abc":"第一","efg":"第二"]
        testdic["abc"] = "修改后的第一"
        
        print("新的字典：\(testdic)")
        
        let testreplace = testdic.updateValue("修改后的第二", forKey: "efg")
        print("被替换的:\(testreplace!)")
        print("新的字典:\(testdic)")
        
        func rectabgleArea( width:Double,  height:Double)->Double{
            let area = width*height
            return area
        }
        
        print("320X480的长方形面积为:\(rectabgleArea(width: 320, height: 480))")
        
        func rectabgleArea1(W width:Double, H height:Double)->Double{
            let area = width*height
            return area
        }
        
        print("320X480的长方形面积为:\(rectabgleArea1(W: 320, H: 480))")
        
        func rectabgleArea2(_ width:Double, H height:Double)->Double{
            let area = width*height
            return area
        }
        
        print("320X480的长方形面积为:\(rectabgleArea2(320, H: 480))")
        
        func makecoffee(type: String = "卡布奇诺") -> String {
            return "制作一杯\(type)咖啡"
        }
        
        let coffee1 = makecoffee(type: "拿铁")
        let coffee2 = makecoffee()
        
        print("\(coffee1)")
        print("\(coffee2)")
        
        func sum(numbers: Double...) ->Double{
            var total:Double = 0
            for number in numbers {
                total += number
            }
            return total
        }
        
        print("打印结果\(sum(numbers: 100.20,20.02,30))")
        print("打印结果\(sum(numbers: 70,80))")
        
        func increment(value: inout Double,A aomout:Double = 1.0){
            value += aomout
        }
        
        var value:Double = 10.0
        
        increment(value: &value)
        print(value)
        
        increment(value: &value, A: 10.0)
        print(value)
        
        func position(dt:Double, speed: (x:Int,y:Int)) -> (x:Int, y:Int){
            
            let posx:Int = speed.x*Int(dt)
            let posy:Int = speed.y*Int(dt)
            
            return(posx,posy)
        }
        
        let move = position(dt: 60.0, speed: (10,-5))
        print(move)
        
        
        //作为函数返回类型使用
        func rectangleArea(width:Double,height:Double)->Double{
            let area = width*height
            return area
        }
        
        func triangleArea(bottom:Double,height:Double)->Double{
            let area = 0.5*bottom*height
            return area;
        }
        
        func getArea(type:String) -> (Double,Double)-> Double{
            var returnFunction:(Double,Double) -> Double
            switch type {
            case "rect":
                returnFunction = rectangleArea
            case "tria":
                returnFunction = triangleArea
            default:
                returnFunction = rectangleArea
            }
            return returnFunction
        }
        
        func getAreaByFunc(funcName: (Double,Double) -> Double,a: Double, b: Double) -> Double{
            let area = funcName(a,b);
            return area;
        }
        
        var area:(Double,Double)->Double = getArea(type: "tria")
        print("底10 高15 三角形面积:\(area(10,15))")
        
        area = getArea(type: "rect")
        print("款0 高15 长方形面积:\(area(10,15))")
        
        var result:Double = getAreaByFunc(funcName: triangleArea, a: 10, b: 15)
        print("底10 高15，三角形面积:\(result)")
        
        result = getAreaByFunc(funcName: rectangleArea, a: 10, b: 15)
        print("宽10 高15，长方形面积:\(result)")
        
        
        func clacuate(opr:String)->(Int,Int)-> Int{
            
            //定义+函数
            func add(a: Int,b:Int)-> Int{
                return a+b
            }
            
            func mins(a:Int,b:Int)->Int{
                return a-b
            }
            
            var result:(Int,Int)->Int
            
            switch (opr) {
            case "+":
                result = add
            case "-":
                result = mins
            default:
                result = add
            }
            return result
        }
        
        let f1:(Int,Int)->Int = clacuate(opr: "+")
        print("10+5 = \(f1(10,5))")
        
        let f2:(Int,Int)->Int = clacuate(opr: "-")
        print("10-5 = \(f2(10,5))")
        
        
        func clacuate1(opr:String)->(Int,Int)-> Int{
            
            var result:(Int,Int)->Int
            
            switch (opr) {
            case "+":
                result = {
                    (a:Int, b:Int) -> Int in return a+b
                }
            case "-":
                result = {a,b in return a-b}
            case "*":
                result = {$0 + $1}
            default:
                result = {
                    a,b in a+b
                }
            }
            return result
        }
        
        let f3:(Int,Int)->Int = clacuate1(opr: "+")
        print("10+5 = \(f3(10,5))")
        
        
        let c1:Int = {(a:Int, b:Int) ->Int in return a+b
        }(3,4)
        
        print("3+4=\(c1)")
        
        
        func makeArray() ->(String)-> [String]{
            var ary:[String] = [String]()
            func addElement(element:String) ->[String]{
                ary.append(element)
                return ary
            }
            return addElement
        }
        
        
        func makeArray1() ->(String) -> [String]{
            var ary:[String] = [String]()
            return {(element:String) -> [String]in
                ary.append(element)
                return ary
                
            }
        }
        
        enum WeekDays0 {
            case Monday
            case Tuesday
            case Wednesday
            case Thursday
            case Friday
        }
        
        enum WeekDays {
            case Monday,Tuesday,Wednesday,Thursday,Friday
        }
        
        var day = WeekDays.Friday
        day = WeekDays.Wednesday
        day = .Monday
        
        func writeGreeting(day:WeekDays){
            switch day {
            case .Monday:
                print("星期一好")
            case .Tuesday:
                print("星期二好")
            case .Wednesday:
                print("星期三好")
            case .Thursday:
                print("星期四好")
            case .Friday:
                print("星期五好")
            }
        }
        
        writeGreeting(day:day)
        
        writeGreeting(day:WeekDays.Friday)
        
        enum Months1: Int{
            case Ju  = 0
            case Fre = 1
            case May = 2
            case Muc = 3
        }
        
        enum Months: Int{
            case Ju  = 0,Fre,May,Muc
        }
        
        var mon = Months.Muc
        
        func writhM(mon:Months){
            switch mon {
                case .Ju:
                    print("一月好")
                case .Fre:
                    print("二月好")
                case .May:
                    print("三月好")
                case .Muc:
                    print("四月好")
            }
        }
            
        let monj = Months.Ju.rawValue
            
        let monf = Months(rawValue: 2)
        
        if(Months.Ju.rawValue == 1){
           print("这个月一月")
        }
        
        writhM(mon: mon)
        writhM(mon: Months.May)
        writhM(mon: monf!)
        
        let hh:String = "ni"
        print("\(String(hh))")
        
        print("打印\(monj)")
        print("打印\(monf!)")
        
        enum Figure {
            case Rectangle(Int,Int)
            case Circle(Int)
        }
        
        func printFigure(figure: Figure){
            switch figure {
             case .Rectangle(let width, let height):
                print("宽：\(width)高：\(height)")
             case .Circle(let width):
                print("半径：\(width)")
            }
        }
        
        let figure = Figure.Rectangle(1024, 768)
        let Circle = Figure.Circle(600)
        
        printFigure(figure:figure)
        printFigure(figure:Circle)
        
        var dept = Department()
        dept.no = 10
        dept.name = "销售部门"
        
        var dept0 = Department()
        dept0.no = 10
        dept0.name = "销售部门"

        let emp = Employee()
        emp.no = 1000
        emp.name = "小庄"
        emp.job = "程序猿"
        emp.salary = 12250
        emp.dept = dept
        
        let emp0 = Employee()
        emp0.no = 1000
        emp0.name = "小庄"
        emp0.job = "程序猿"
        emp0.salary = 12250
        emp0.dept = dept
        
        if emp === emp0 {
            print("emp === emp0")
        }else{
            print("不等于")
        }
        

        
        
        func update (dept: inout Department){
            dept.name = "研发部"
        }
        print("更新前\(dept.name)")
        update(dept: &dept)
        print("更新后\(dept.name)")

        func updateEmp (emp:Employee){
            emp.job = "产品经理"
        }
        
        print("更新前\(emp.job!)")
        updateEmp(emp: emp)
        print("更新后\(emp.job!)")
        
       
        func Dengyu(lhs:Department, rhs:Department) -> Bool{
            return lhs.name == rhs.name && lhs.no == rhs.no
        }
        
        func Budengyu(lhs:Department, rhs:Department) -> Bool{
            if(lhs.name != rhs.name || lhs.no != rhs.no){
                return true
            }
            return false
        }
        
        let TOL:HToosl = HToosl()
        TOL.tets()
        
        let ttol = HToosl.daifan()
        print(ttol)
        
        //结构体与类
        class JJzhuang{
            var no:Int = 0
            var name:String = ""
            var job:String?
            var salary:Double = 0
            var dept: Department?
        }
        
        let zhang = JJzhuang()
        zhang.no = 10;
        
                
    }
    
    //定义一个Blog(博客)结构体 这快放viewDidLoad里面也行 因为swift 的的函数很灵活
    struct Blog {
        var name:String?
        let URL:String?
        let Author:String?
    }
    
    func guardStyleBlog(bloa: Blog){
        guard let blogName = bloa.name else {
            print("这篇博客没有名字")
            return
        }
        print("这篇博客名：\(blogName)")
    }
    
    //结构体与类
    class Employee{
        var no:Int = 0
        var name:String = ""
        var job:String?
        var salary:Double = 0
        var dept: Department?
    }
    
    struct Department {
        var no:Int = 0
        var name:String = ""
    }
    

    

    
}



