//
//  TimerViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/21.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var timer :Timer!
    var label :UILabel!
    
    
    var timeVaule   = 10
    
    let viewWidth   = UIScreen.main.bounds.size.width
    let viewHeight  = UIScreen.main.bounds.size.height
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        createTimer()
        createButton()
        createLabel()
        
    }
  //MARK: ******* createButton *********
    func createButton() {
        
        let titleArray = ["Start","Stop"]
        
        for i in 0...1 {
           let button = UIButton(frame: CGRect(x: 80+130*i, y: 200, width: 100, height: 30))
            
            button.setTitle(titleArray[i], for: .normal)
            button.setTitleColor(UIColor.brown, for: .normal)
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2
            
            button.clipsToBounds = true
            button.layer.cornerRadius = 5
            button.tag = 100 + i
            
            button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    //MARK: ******** buttonClicked **********
    func buttonClicked(_ button:UIButton) {
        if button.tag == 100 {
            //启动定时器
            timer.fireDate = NSDate.distantPast
        } else {
            //暂停定时器
            timer.fireDate = NSDate.distantFuture
        }
    }
    
    //MARK: ************创建label************
    func createLabel(){
        label = UILabel(frame:CGRect(x:20,y:viewHeight-300,width:viewWidth-40,height:200))
        
        label.text =  String(timeVaule) + "s"
        label.textAlignment = .center
        
        label.textColor = UIColor.green
        
//        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = 5.0
        
        self.view.addSubview(label)
        
    }
    
    @discardableResult
    //MARK: ************** 创建定时器 *************
    func createTimer() -> Timer {
        
        //创建启用计时器，控制每5秒执行一次timerAction方法
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction(_:)), userInfo: nil, repeats: true)
        
        timer.fireDate = Date.distantFuture
        

//        public convenience init(fire date: Date, interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void)
        
        
//        public init(fireAt date: Date, interval ti: TimeInterval, target t: Any, selector s: Selector, userInfo ui: Any?, repeats rep: Bool)
        
        
//         open class func scheduledTimer(withTimeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void) -> Timer
        
//         open class func scheduledTimer(timeInterval ti: TimeInterval, target aTarget: Any, selector aSelector: Selector, userInfo: Any?, repeats yesOrNo: Bool) -> Timer
      

/*
//        let timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: (Timer) -> Void)
        
        let timer2 = Timer.init(timeInterval: 1.0, target: self, selector: #selector(timerAction(_:)), userInfo: nil, repeats: true)
        
        
        timer2.fireDate = Date.distantFuture
*/
        
        
        
        
        /**
         *public /*not inherited*/ init(timeInterval ti: TimeInterval, invocation: NSInvocation, repeats yesOrNo: Bool)
         
         open class func scheduledTimer(timeInterval ti: TimeInterval, invocation: NSInvocation, repeats yesOrNo: Bool) -> Timer
         
         
         public /*not inherited*/ init(timeInterval ti: TimeInterval, target aTarget: Any, selector aSelector: Selector, userInfo: Any?, repeats yesOrNo: Bool)
         
         open class func scheduledTimer(timeInterval ti: TimeInterval, target aTarget: Any, selector aSelector: Selector, userInfo: Any?, repeats yesOrNo: Bool) -> Timer
         *
         */  // /*not inherited*/----->未继承
        
        //
        
          return timer
    }
    //MARK: ************** 定时器执行事件 **************
    func timerAction(_ timer:Timer) {
        
        timeVaule -= 1
       if timeVaule == 0 {
            timeVaule = 10
        }

        label.text = String(timeVaule) + "s"
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //视图小时候，注销定时器
        timer.invalidate()
        timer = nil
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
