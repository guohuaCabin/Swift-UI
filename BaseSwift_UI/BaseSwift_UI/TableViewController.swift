//
//  TableViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/17.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var tableView : UITableView!
    
    lazy var dataArray : [String] = {
        
        return ["NSTimer","UIview简单动画","毛玻璃效果","Block传值","delegate传值","弱引用","图片拉伸","NSUserDefault","归档NSKeyedArchiver","绘图","延迟的几种方法","NSDate","相册","LED灯","打印","UIPasteboard剪贴板","访问通讯录联系人"]
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "TableViewController"
       
        
        createTableView()
        
        
    }
//MARK: *****************创建tableView ***********
    func createTableView() {
        self.automaticallyAdjustsScrollViewInsets = true
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier:String = "cellId"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        cell?.accessoryType = .disclosureIndicator
        
        cell?.textLabel?.text = dataArray[indexPath.row]
        
        return cell!
   
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        print("Clicked \(cell?.textLabel?.text)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}










