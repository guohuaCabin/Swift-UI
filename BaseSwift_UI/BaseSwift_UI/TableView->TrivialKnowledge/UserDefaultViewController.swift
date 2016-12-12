//
//  UserDefaultViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/12/1.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class UserDefaultViewController: UIViewController,UITextFieldDelegate {

    var viewWidth = UIScreen.main.bounds.size.width
    
    
    var textField : UITextField!
    var label : UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        
        createUI()
    }

    func createUI()  {
        self.textField = UITextField(frame: CGRect(x: 20.0, y: 100.0, width: viewWidth - 40.0, height: 60.0))
        
        self.textField.placeholder = "please input word"
        
        let text = UserDefaults.standard.object(forKey: "comment") != nil ? UserDefaults.standard.object(forKey: "comment") :"左牵黄右擎苍，锦帽貂裘千骑卷平冈"
        
        
        self.textField.text = text as! String?
        
        self.textField.layer.cornerRadius = 5.0
        self.textField.clipsToBounds = true
        
        self.textField.layer.borderColor = UIColor.brown.cgColor
        self.textField.layer.borderWidth = 0.5
        
        self.textField.delegate = self
        
        self.textField.adjustsFontSizeToFitWidth = true
        
//        self.textField.clearsOnBeginEditing = true
        
        self.textField.clearButtonMode = .whileEditing
        
        self.view.addSubview(self.textField)
        
        
        self.label = UILabel(frame: CGRect(x: 20.0, y: 200.0, width: viewWidth - 40.0, height: 100.0))
        self.label.text = self.textField.text
        
        self.label.clipsToBounds = true
        self.label.layer.cornerRadius = 5.0
        
        self.label.textColor = UIColor.brown
        self.label.layer.borderWidth = 1.0
        self.label.layer.borderColor = UIColor.black.cgColor
        self.label.numberOfLines = 0
        
        self.view.addSubview(self.label)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        UserDefaults.standard.set(textField.text, forKey: "comment")
        
     
        return true
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.label.text = textField.text
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        self.label.text = textField.text
        
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        self.label.text = newText
        
        return  true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
