//
//  ScrollViewAndPageControl.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/17.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class ScrollViewAndPageControl: UIViewController,UIScrollViewDelegate {

    var scrollView:UIScrollView!
    
    var pageControl:UIPageControl!
    
    var pictureArray :NSArray!
    
    let viewWidth:CGFloat = UIScreen.main.bounds.size.width
    let viewHeight:CGFloat  = UIScreen.main.bounds.size.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "ScrollViewAndPageControl"
       
        pictureArray = ["01","02","03","04","05"]
        
        createPicturePlay()
        
    }
 //MARK: ************* 创建图片轮播 ******
    func createPicturePlay(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        //scrollView
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: viewWidth, height: viewHeight-64))
        
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.isPagingEnabled = true
        
        scrollView.delegate = self
        
        
        scrollView.contentSize = CGSize(width: viewWidth * CGFloat(pictureArray.count), height: viewHeight - 64)
        
        self.view.addSubview(scrollView)
        
        //imageView
        for i in 0..<pictureArray.count {
            let imageView = UIImageView(frame: CGRect(x: viewWidth*CGFloat(i), y: 0, width: viewWidth, height: viewHeight - 64))
            
            imageView.image = UIImage(named:"\(pictureArray[i])")
            
            imageView.contentMode = .scaleAspectFill

            imageView.layer.cornerRadius = 5
            
            imageView.clipsToBounds = true
            
            imageView.layer.borderWidth = 1
            
            imageView.layer.borderColor = UIColor.black.cgColor
            
            scrollView.addSubview(imageView)
        }
        
        //pageControl
        pageControl = UIPageControl(frame: CGRect(x: 0, y: viewHeight - 50, width: viewWidth, height: 30))
        
        pageControl.currentPage = 0
        
        pageControl.numberOfPages = pictureArray.count
        
        pageControl.pageIndicatorTintColor = UIColor.white
        
        pageControl.currentPageIndicatorTintColor = UIColor.black

        pageControl.addTarget(self, action: #selector(pageControlAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(pageControl)
        
    }
    
    //MARK: ************** pageControl Action ************
    func pageControlAction(_ pageControl:UIPageControl) {
        
        var frame = scrollView.frame
        
        frame.origin.x = frame.size.width * CGFloat(pageControl.currentPage)

        scrollView.scrollRectToVisible(frame, animated: true)
        
    }
    
    //MARK: ***********scorllViewDelegate**************
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageIndex = scrollView.contentOffset.x / scrollView.frame.size.width
        
        pageControl.currentPage = Int(pageIndex)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
