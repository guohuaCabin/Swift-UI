//
//  ByValueViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/29.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit


class ByValueViewController: UIViewController,UITextFieldDelegate {

    let viewWidth = UIScreen.main.bounds.size.width
    var textField :UITextField!
  
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
        
        self.textField.placeholder = "please input words"
        
        self.textField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        self.textField.keyboardType = UIKeyboardType.namePhonePad
        
        self.textField.keyboardAppearance = UIKeyboardAppearance.default
        
        self.textField.returnKeyType = UIReturnKeyType.done
        
        self.textField.adjustsFontSizeToFitWidth = true
        //设置最小可缩小字号
        self.textField.minimumFontSize = 14;
        
        self.textField.isSecureTextEntry = true
        
        self.textField.tag = 100
        
        self.view.addSubview(self.textField)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
      
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}









