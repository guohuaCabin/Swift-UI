//
//  BlurEffectViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/28.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class BlurEffectViewController: UIViewController {

    var imageView1 :UIImageView!
    
    
    let space = 20.0
    var viewY = 100.0
    let viewWidth   = Double(UIScreen.main.bounds.width - 40.0)
    let viewHeight  = (UIScreen.main.bounds.height - 100.0)*0.5
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        createBackgroundImageView()
        showBlurEffect()
        showBlurEffectWithUIVibrancyEffect()
        
    }

    //MARK: ******* 创建背景图片 *************
    func createBackgroundImageView() {
        self.imageView1 = UIImageView(frame: self.view.bounds)
        
        imageView1.layer.borderColor     = UIColor.black.cgColor
        imageView1.layer.borderWidth     = 2
        
        imageView1.layer.cornerRadius    = 5
        
        imageView1.clipsToBounds         = true
    
        imageView1.image = UIImage(named: "05")
        
        self.view.addSubview(imageView1)
        
    }
    
    func showBlurEffect() {
        
        //创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .light)
        //创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = CGRect(x: 0, y: 64, width: viewWidth+2*space, height: Double(viewHeight))

        let label = UILabel(frame: CGRect(x: 10, y: 100, width: viewWidth - 20, height: 100))
        
        label.text = "bfjnecsjdkcmslc,samosacmsacdfvneaui"
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        blurView.contentView.addSubview(label)
        
        self.view.addSubview(blurView)
        
    }
    
    func showBlurEffectWithUIVibrancyEffect() {
        //创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .light)
        //创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = CGRect(x: 0, y: Double(viewHeight+80), width: viewWidth+2*space, height: Double(viewHeight))
        
        self.view.addSubview(blurView)
        
        //创建并添加vibrancy视图
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        
        let vibrancyView = UIVisualEffectView(effect:vibrancyEffect)
        vibrancyView.frame = self.view.bounds
       
        
        let label = UILabel(frame: CGRect(x: 10, y: viewY, width: viewWidth - 20, height: 100))
        
        label.text = "bfjnecsjdkcmslc,samosacmsacdfvneaui"
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        vibrancyView.contentView.addSubview(label)
        
        blurView.contentView.addSubview(vibrancyView)
        
        self.view.addSubview(blurView)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}












