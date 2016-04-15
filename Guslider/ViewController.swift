//
//  ViewController.swift
//  Guslider
//
//  Created by Ricardo Marcelo Suman Júnior on 4/14/16.
//  Copyright © 2016 BEPiD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 0, y: 0, width: 300, height: 500)
        let firstImage = UIImage(named: "draw")
        let firstImageView = UIImageView(image: firstImage)
        let secondImage = UIImage(named: "photo")
        let secondImageView = UIImageView(image: secondImage)
        
        let slider = Guslider(frame: rect, firstView: firstImageView, secondView: secondImageView)
        
        slider.center = view.center
        //slider.frame = CGRectMake(view.frame.origin.x, 150, view.frame.size.width, view.frame.size.height)
        view.addSubview(slider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

