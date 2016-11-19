//
//  PickerViewAndDatePickerViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/17.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class PickerViewAndDatePicker: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    let viewWidth = UIScreen.main.bounds.size.width
    let viewHeight = UIScreen.main.bounds.size.height - 64
    
    var pickerView :UIPickerView!
    var datePicker :UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "PickerViewAndDatePicker"
        
        //创建PickerView
       createPickerView()
        
        //createDatePicker
        createDatePicker()
        
    }
    //MARK: **********UIDatePicker *************
    func createDatePicker() {
        datePicker = UIDatePicker(frame: CGRect(x: 10, y: viewHeight/2 + 74, width: viewWidth-20, height: viewHeight/2-20))
        //将日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN") as Locale
        
        
        datePicker.addTarget(self, action: #selector(datepickerAction(_:)), for: .valueChanged)
        
        datePicker.layer.cornerRadius = 5
        datePicker.clipsToBounds = true
        datePicker.layer.borderWidth = 2
        datePicker.layer.borderColor = UIColor.brown.cgColor
        
        self.view.addSubview(datePicker)
        
        
    }
    //日期选择器响应方法
    func datepickerAction(_ datePicker:UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        print(formatter.string(from: datePicker.date))
        
    }
    
   @discardableResult
//MARK: ********* 创建PickerView ***********
    func createPickerView() -> UIPickerView {
    
        self.automaticallyAdjustsScrollViewInsets = false
       pickerView = UIPickerView(frame: CGRect(x: 10, y: 64, width: viewWidth-20, height: viewHeight/2-20))
        pickerView.delegate = self

        pickerView.dataSource = self
    
        pickerView.selectRow(3, inComponent: 0, animated: true)
        pickerView.selectRow(6, inComponent: 1, animated: true)
        pickerView.selectRow(4, inComponent: 2, animated: true)
    
        pickerView.layer.cornerRadius = 5
        pickerView.clipsToBounds = true
        pickerView.layer.borderColor = UIColor.black.cgColor
        pickerView.layer.borderWidth = 3
    
        self.view.addSubview(pickerView)
    
        return pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "akxamax"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
