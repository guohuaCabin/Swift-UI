//
//  Delegate_ByValueViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/29.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class Delegate_ByValueViewController: UIViewController,UITextFieldDelegate {

    
    let viewWidth = UIScreen.main.bounds.size.width
    
    
    var textField :UITextField!
    
    var byValueVC = ByValueViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createTextField()
        
        createBtton()
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
    //MARK: **********创建button********
    @discardableResult
    func createBtton() -> (UIButton) {
        
        let button = UIButton(frame:CGRect(x:10,y:400,width:viewWidth-20,height:40))
        
        button.setTitle("跳转->ByValueVC", for: .normal)
        
        button.setTitleColor(UIColor.black, for: .normal)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
        button.layer.cornerRadius = 5.0
        
        button.layer.masksToBounds = true
        
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(button)
        
        return button
        
    }
    //MARK: ******button点击事件*******
    func buttonClicked(sender:UIButton) -> () {

        print("clicked button ......")
        
        self.navigationController?.pushViewController(byValueVC, animated: true)
 
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}








