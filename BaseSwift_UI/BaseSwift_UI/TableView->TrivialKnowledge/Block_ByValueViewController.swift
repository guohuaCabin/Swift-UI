//
//  Block_ByValueViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/29.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit



class Block_ByValueViewController: UIViewController,UITextFieldDelegate {

    let viewWidth = UIScreen.main.bounds.size.width
    var viewY = 100.0
    
    
    var textField :UITextField!
    
    var byValueVC = ByValueViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        createLabel()
        createTextField()
        createBtton()
    }
    //MARK: ************创建label************
    func createLabel(){
        
        let label = UILabel(frame:CGRect(x: 10.0, y: viewY, width: Double(viewWidth-20.0), height: 80.0))
        
        label.text = "说明：\n 可以直接在输入框输入，点击按钮跳转，即正向传值，返回时即反向传值"
//        label.textAlignment = .center
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.brown
        label.layer.borderColor = UIColor.brown.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = 5.0
        
        label.numberOfLines = 0
        self.view.addSubview(label)
        
        viewY += 100.0
    }
    
    //MARK: **********创建textField***********
    func createTextField(){
        self.textField = UITextField(frame: CGRect(x: 10.0, y: viewY, width: Double(viewWidth-20.0), height: 80.0))
        
        self.textField.delegate = self
        
        self.textField.layer.cornerRadius = 5.0
        self.textField.clipsToBounds = true
        
        //设置圆角，但不能设置边线
        self.textField.borderStyle = UITextBorderStyle.roundedRect
        
        self.textField.layer.borderWidth = 2
        self.textField.layer.borderColor = UIColor.brown.cgColor
        
        self.textField.placeholder = "点击按钮跳转，即正向传值，返回时即反向传值"
        
        self.textField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        self.textField.keyboardType = UIKeyboardType.namePhonePad
        
        self.textField.keyboardAppearance = UIKeyboardAppearance.default
        
        self.textField.returnKeyType = UIReturnKeyType.done
        
        self.textField.adjustsFontSizeToFitWidth = true
        
        //设置最小可缩小字号
//        self.textField.minimumFontSize = 14;
        
//        self.textField.isSecureTextEntry = true
  
        self.textField.tag = 100
        
        self.view.addSubview(self.textField)
        
        viewY += 200.0
    }
    
    
    //MARK: **********创建button********
    @discardableResult
    func createBtton() -> (UIButton) {
        
        let button = UIButton(frame:CGRect(x: 10.0, y: viewY, width: Double(viewWidth-20.0), height: 40.0))
        
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
        
        byValueVC.initWithClosure { (sendVauleMessage:String?)->Void in
            self.textField.text = sendVauleMessage
        }
        
        byValueVC.sendValueAttributeMessage = self.textField.text
        
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
