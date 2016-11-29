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
    
    
    
    
    lazy var dataArray : [String] = {
        
        return ["NSTimer","UIView简单动画","毛玻璃效果","Block传值和弱引用","delegate传值和弱引用","图片拉伸","NSUserDefault","归档NSKeyedArchiver","绘图","延迟的几种方法","NSDate","相册","LED灯","打印","UIPasteboard剪贴板","访问通讯录联系人"]
        
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
//        return ["NSTimer","UIView简单动画","毛玻璃效果","Block传值","delegate传值","弱引用","图片拉伸","NSUserDefault","归档NSKeyedArchiver","绘图","延迟的几种方法","NSDate","相册","LED灯","打印","UIPasteboard剪贴板","访问通讯录联系人"]
        
        
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(timerVC, animated: true)
            break
        case 1:
            self.navigationController?.pushViewController(self.viewAnimationVC, animated: true)
            break
        case 2:
            self.navigationController?.pushViewController(self.blurEffectVC, animated: true)
            break
        case 3:
            self.navigationController?.pushViewController(blockVC, animated: true)
            break
        case 4:
            self.navigationController?.pushViewController(delegateVC, animated: true)
            break
        case 5:
            self.navigationController?.pushViewController(imageStretchVC, animated: true)
            break
        case 6:
            break
        case 7:
            break
        case 8:
            break
        case 9:
            break
        case 10:
            break
        case 11:
            break
        case 12:
            break
        case 13:
            break
        case 14:
            break
        case 15:
            break
        default:
            break
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}










