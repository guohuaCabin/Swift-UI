//
//  ImageViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/17.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var imageView1:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "ImageView"
        
        createImageView()
    }
//MARK: ************ 创建UIImageView **************
    func createImageView() {
        
        let viewWidth = self.view.bounds.size.width
        
        imageView1 = UIImageView()
        imageView1 = UIImageView(frame: CGRect(x: 20, y: 100, width: viewWidth-40, height: 200))
        
        imageView1.image = UIImage(named: "05")
        //让图片先自适应UIImageView
        imageView1.contentMode = .scaleAspectFit
        
        //按比例自动调整imageView1的frame坐标
        imageView1.frame = setFrame(frame: CGRect(x: 20, y: 100, width: viewWidth-40, height: 200), image: UIImage(named: "05")!)

        imageView1.layer.cornerRadius = 8
        
        imageView1.clipsToBounds = true
        
        imageView1.layer.borderColor = UIColor.black.cgColor
        imageView1.layer.borderWidth = 2
        
        self.view.addSubview(imageView1)
        
        
        let imageView2 = UIImageView(image: UIImage(named: "04"))
    
        imageView2.frame = CGRect(x: 20, y: 380, width: viewWidth - 40, height: 300)
        
        imageView2.layer.cornerRadius = 8
        
        imageView2.clipsToBounds = true
        
        //让图片自适应UIImageView
        imageView2.contentMode = .scaleAspectFill
        
        
        
        imageView2.layer.borderColor = UIColor.brown.cgColor
        imageView2.layer.borderWidth = 1
        
        self.view.addSubview(imageView2)
        
        
    }
    
    func setFrame(frame: CGRect, image: UIImage) -> CGRect{
        
        // 判断图片的尺寸是不是小于imageView的尺寸
        
        // 如果图片的尺寸小于imageView的尺寸，将图片的尺寸做为imageView的尺寸
        
        // 如果图片的尺寸大于imageView的尺寸：
        
        // 1、 图片宽与高的比例 scale = width / height
        
        // 2、 对比图片宽与高的大小，判断是宽大于高，还是高大于宽;
        
        // 3、 如果宽大于高，则需要设置imageView的高，根据图片宽高比scale求imageView得高;
        
        //     如果高大于宽，则需要设置imageView的宽，根据图片宽高比scale求imageView的宽;
        
        // 注： imageView.contentMode = .ScaleAspectFit
        
        var _frame: CGRect = CGRect()
        
        if image.size.width < imageView1.frame.width && image.size.height < imageView1.frame.height {
            
            _frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: image.size.width, height: image.size.height)
            
        } else if image.size.width > imageView1.frame.width && image.size.height > imageView1.frame.height{
            
            // 图片宽与高的比例
            
            let scaleWH: CGFloat = image.size.width / image.size.height
            
            // 对比图片宽与高的大小， 宽>高
            
            if image.size.width > image.size.height {
                
                // 根据图片宽高比scale求imageView得高
                
                let imageViewHeight: CGFloat = imageView1.frame.width / scaleWH
                
                // 设置frame
                
                _frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: imageViewHeight)
                
            }else if image.size.width < image.size.height {
                
                let imageViewWidth: CGFloat = imageView1.frame.height * scaleWH
                
                _frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: imageViewWidth, height: frame.size.width)
                
            }
            
        }        
        
        return _frame
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}









