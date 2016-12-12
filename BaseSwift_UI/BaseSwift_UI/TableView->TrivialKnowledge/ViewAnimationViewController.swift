//
//  ViewAnimationViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/28.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class ViewAnimationViewController: UIViewController {

    var viewY = 100.0
    let space = 100.0
    let viewWidth = Double(UIScreen.main.bounds.size.width - 200.0)
    let viewHeight = 100.0
    
    
    
    
    
    var animationView1 : UIView!
    var animationView2 : UIView!
    var animationView3  : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        createAnmationView()
   
    }

    //MARK: ******** createAnmationView **********
    func createAnmationView(){
        
        self.animationView1 = UIView(frame: CGRect(x: space, y: viewY, width: viewWidth, height: viewHeight))
        
        self.animationView1.backgroundColor = UIColor.purple
        self.animationView1.layer.cornerRadius = 5
        self.animationView1.clipsToBounds = true
        self.animationView1.layer.borderColor = UIColor.black.cgColor
        self.animationView1.layer.borderWidth = 2
        
        viewY += viewHeight + 30
        
        self.animationView2 = UIView(frame: CGRect(x: space, y: viewY, width: viewWidth, height: viewHeight))
        
        self.animationView2.backgroundColor = UIColor.orange
        self.animationView2.layer.cornerRadius = 5
        self.animationView2.clipsToBounds = true
        self.animationView2.layer.borderColor = UIColor.black.cgColor
        self.animationView2.layer.borderWidth = 2
        
        viewY += viewHeight + 30
        
        self.animationView3 = UIView(frame: CGRect(x: space, y: viewY, width: viewWidth, height: viewHeight))
        
        self.animationView3.backgroundColor = UIColor.white
        self.animationView3.layer.cornerRadius = 5
        self.animationView3.clipsToBounds = true
        self.animationView3.layer.borderColor = UIColor.black.cgColor
        self.animationView3.layer.borderWidth = 2
        
        
        self.view.addSubview(self.animationView1)
        self.view.addSubview(self.animationView2)
        self.view.addSubview(self.animationView3)
        
        
        viewWithAnmationOne()
        viewWithAnmationTwo()
        viewWithAnmationViewThree()
        
    }
    
    func viewWithAnmationOne() {
        
        UIView.animate(withDuration: 2.0) {
            self.animationView1.frame.origin.x -= 50
        }
        
    }
    
    func viewWithAnmationTwo() {
        
        UIView.animate(withDuration: 5.0, animations: {
            self.animationView2.frame.size.width -= 200;
            
        }) {
            (finished: Bool) -> Void in
            self.animationView2.layer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(M_PI_2)))
        }
        
    }
    
    func viewWithAnmationViewThree() {
        
        
        UIView.animate(withDuration: 2, delay: 5.0, options: .transitionCurlDown, animations: {
            self.animationView3.frame.size.height += 70
            self.animationView3.frame.size.width  -= 80
        }, completion: {
            (finished: Bool) -> Void in
            self.animationView3.frame = CGRect(x: self.space, y: self.viewY, width: self.viewWidth, height: self.viewHeight+200)
        })
        
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}






