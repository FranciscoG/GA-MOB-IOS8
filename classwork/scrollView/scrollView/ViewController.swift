//
//  ViewController.swift
//  scrollView
//
//  Created by Francisco Gutierrez on 3/1/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView : UIImageView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self;
        
        imageView = UIImageView()
        imageView?.image = UIImage(named: "spacecat.jpg")
        imageView?.sizeToFit()
        scrollView.contentSize = imageView!.frame.size
        scrollView.addSubview(imageView!)
        scrollView.backgroundColor = UIColor.blackColor()

    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }


}

