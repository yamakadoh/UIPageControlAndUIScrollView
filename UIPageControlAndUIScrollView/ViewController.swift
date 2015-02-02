//
//  ViewController.swift
//  UIPageControlAndUIScrollView
//
//  Created by yamakadoh on 1/31/15.
//  Copyright (c) 2015 yamakadoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UIScrollView
        var scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        println("scrollView.frame = \(scrollView.frame)")
        
        let numImage = 3
        let imageFiles = ["image1.jpg", "image2.jpg", "image3.png"]
        for var i=0; i<numImage; i++ {
            let image = UIImage(named: imageFiles[i])!
            var imageView = UIImageView(image: image)
            imageView.frame.origin = CGPointMake(/*image.size.width*/self.view.frame.size.width * CGFloat(i), 0)
            imageView.frame.size = /*image.size*/CGSizeMake(self.view.frame.size.width, image.size.height)
            //imageView.tag = i + 1
            scrollView.addSubview(imageView)
        }
        let widthImage: CGFloat = self.view.frame.size.width
        let heightImage: CGFloat = 180
        scrollView.contentSize = CGSizeMake(widthImage * CGFloat(numImage), heightImage)
        scrollView.pagingEnabled = true // ページスクロールON
        scrollView.showsHorizontalScrollIndicator = false   // 横方向のスクロールインジケータOFF
        scrollView.showsVerticalScrollIndicator = false   // 縦方向のスクロールインジケータOFF
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        // UIPageControl
        let heightPageControl = 15
        pageControl.frame = CGRectMake(0, CGFloat(180 - heightPageControl), self.view.frame.size.width, CGFloat(heightPageControl))
        //pageControl.backgroundColor = UIColor.orangeColor()
        pageControl.userInteractionEnabled = false
        pageControl.numberOfPages = numImage
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("scrollViewDidScroll")
        // このメソッドやたら呼ばれるので、ページ切り替え終了で呼ばれるscrollViewDidEndDeceleratingでページ数を設定する
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        println("scrollViewDidEndDecelerating")
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}

