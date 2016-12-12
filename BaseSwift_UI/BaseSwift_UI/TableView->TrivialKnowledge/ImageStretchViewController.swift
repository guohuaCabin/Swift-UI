//
//  ImageStretchViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/29.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class ImageStretchViewController: UIViewController {

    let viewWidth = UIScreen.main.bounds.size.width
    let viewHeight = (UIScreen.main.bounds.size.height - 100.0) * 0.5
    var viewY:CGFloat = 100.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        
        createImageView()
        
    }
    
    lazy var titlesArray:[String] = {
        return ["按照图片大小设置frame后的图片：",
                "frame一定，直接加载图片：",
                "frame一定，对图片进行拉伸处理"]
    }()
    
    func createImageView() {
        
         let image = UIImage(named: "desktop")
        //MARK: 第一个是没有拉伸的图片
        //第二个是经过拉伸的图片
        
        
        for i in 0...2 {
            
            let explainLabel = UILabel(frame: CGRect(x: 10.0, y: viewY, width: viewWidth - 20.0, height: 40))
            explainLabel.text = titlesArray[i]
            explainLabel.textColor = UIColor.yellow
            explainLabel.font = UIFont.systemFont(ofSize: 16)
            explainLabel.layer.cornerRadius = 5.0
            explainLabel.clipsToBounds = true
//            explainLabel.layer.borderColor = UIColor.white.cgColor
//            explainLabel.layer.borderWidth = 0.5
            
            viewY += 50

            let imageView = UIImageView()

            if i == 0 {
                imageView.frame = CGRect(x: 10, y: viewY , width: 100, height: 54)
                imageView.image = image
                
               
            } else if i == 1{
                imageView.frame = CGRect(x: 10.0, y: viewY, width: viewWidth - 20.0, height: 54)
                
                imageView.image = image
            }else{
                imageView.frame = CGRect(x: 10.0, y: viewY, width: viewWidth - 20.0, height: 54)
                imageView.image = self.StretchResizableImage(image!)
            }
            viewY += 80.0
            self.view.addSubview(explainLabel)
            self.view.addSubview(imageView)
            
        }
  
    }
    
    func StretchResizableImage(_ image:UIImage) -> UIImage {
        let image = image.resizableImage(withCapInsets: .init(top: 45, left: 80, bottom: 2, right: 2), resizingMode: .stretch)
        
        return image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
