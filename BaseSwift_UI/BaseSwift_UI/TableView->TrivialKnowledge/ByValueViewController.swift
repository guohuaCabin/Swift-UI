//
//  ByValueViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/29.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

/**
 协议传值，主要用于代理传值。
 在Swift3.0之前如果要定义协议中可选方法，只需要给协议加上@objc之后方法使用optional修饰就可以了，但是Swift3.0中除了协议需要@objc修饰，可选方法也必须使用@objc来修饰。
 
 */

//声明协议
@objc protocol  ByValueVCDelegate{
    @objc optional func  sendValueMessage(byValueViewController:ByValueViewController,message:String?)
}

/**
 *闭包传值步骤：
 Tips：
 1、为闭包取别名，可在参数列表中将需要传递的参数写成形参；
 
 2、设置一个方法持有当前block；
 
 3、在合适的地方进行调用类似于代理；
 
 4、在创建该对象的地方进行闭包方面的调用；
 */

//为闭包取个别名，声明一个闭包类型
typealias sendValueClosure = (String?) -> ()

class ByValueViewController: UIViewController,UITextFieldDelegate {

    let viewWidth = UIScreen.main.bounds.size.width
    var textField :UITextField!
    
    //用于属性传值
    var sendValueAttributeMessage :String!
    
    //声明协议属性
    /**
     代理属性delegate值为实现了DetailViewControllerDelegate协议的任意对象，weak关键字主要为了防止循环引用导致对象无法释放。
     */
    weak var delegate:ByValueVCDelegate?
    
    //声明闭包属性
    var closure : sendValueClosure!
    
    //闭包传值调用方法
    func initWithClosure(closure: @escaping sendValueClosure) {
        //赋值闭包属性
        self.closure = closure
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
       
        createTextField()
        
    }
    //MARK: **********创建textField***********
    func createTextField(){
        self.textField = UITextField(frame: CGRect(x: 2, y: 150, width: viewWidth-4, height: 80))
        
        self.textField.delegate = self
        
        self.textField.layer.cornerRadius = 5.0
        self.textField.clipsToBounds = true
        
        //设置圆角，但不能设置边线
        self.textField.borderStyle = UITextBorderStyle.roundedRect
        
        self.textField.layer.borderWidth = 2
        self.textField.layer.borderColor = UIColor.brown.cgColor
        
        self.textField.placeholder = "可以直接在输入框输入，返回即反向传值"
        
        self.textField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        self.textField.keyboardType = UIKeyboardType.namePhonePad
        
        self.textField.keyboardAppearance = UIKeyboardAppearance.default
        
        self.textField.returnKeyType = UIReturnKeyType.done
        
        self.textField.adjustsFontSizeToFitWidth = true
        //设置最小可缩小字号
        self.textField.minimumFontSize = 14;
        
        
        self.textField.tag = 100
        
        self.textField.text = sendValueAttributeMessage
        
        self.view.addSubview(self.textField)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
        if closure != nil {
            closure(self.textField.text!)
        }
        
        if let delegate = self.delegate {
            delegate.sendValueMessage!(byValueViewController: self, message: self.textField.text)
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}









