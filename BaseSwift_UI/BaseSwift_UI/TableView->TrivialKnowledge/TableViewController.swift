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
    var timerVC         = TimerViewController()
    var viewAnimationVC = ViewAnimationViewController()
    var blurEffectVC    = BlurEffectViewController()
    var blockVC         = Block_ByValueViewController()
    var delegateVC      = Delegate_ByValueViewController()
    var imageStretchVC  = ImageStretchViewController()
    var userDefaultVC     = UserDefaultViewController()
    var keyedArchiverVC   = KeyedArchiverViewController()
    var drawVC          = DrawViewController()
    var dateVC          = DateViewController()
    var delayVC         = DelayViewController()
    
    
    
    
    
    //懒加载
    lazy var dataArray : [String] = {
        
        return ["NSTimer","UIView简单动画","毛玻璃效果","Block传值","delegate传值和弱引用","图片拉伸","NSUserDefault","归档NSKeyedArchiver","绘图","延迟的几种方法","NSDate","相册","LED灯","打印","UIPasteboard剪贴板","访问通讯录联系人"]
        
    }()
    
    lazy var VCArray = {
       return ["TimerViewController","ViewAnimationViewController","BlurEffectViewController","Block_ByValueViewController","Delegate_ByValueViewController","ImageStretchViewController","UserDefaultViewController","KeyedArchiverViewController","DrawViewController","DelayViewController","DateViewController","","","","",""]
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
        cell?.textLabel?.textColor = UIColor.brown
        return cell!
   
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        print("Clicked \(cell?.textLabel?.text)")

        
/*
        // 1.获取命名空间
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + VCArray[indexPath.row])
        
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            print("无法转换成UIViewController")
            return
        }
         
         // 3.通过Class创建对象
         let childController = clsType.init()
  */
        
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"]
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + VCArray[indexPath.row])
        
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        let clsType = cls as! UIViewController.Type
        // 3.通过Class创建对象
        let childController = clsType.init()

        childController.title = dataArray[indexPath.row]
        
        self.navigationController?.pushViewController(childController, animated: true)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}










