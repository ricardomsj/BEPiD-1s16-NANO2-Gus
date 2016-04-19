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
        
        //let rect = CGRect(x: view.frame.size.width - , y: 0, width: 300, height: 450)
        
        guard let firstImage = UIImage(named: "photo"),
            let secondImage = UIImage(named: "draw") else { return }
        
        let rect = CGRect(x: (view.frame.size.width - firstImage.size.width) / 2, y: 0, width: 300, height: 450)
        
        let slider = Guslider(frame: rect, firstImage: firstImage, secondImage: secondImage)
        
        //slider.center = view.center
        
        view.addSubview(slider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBar.hidden = true
        //self.ddd.font = UIFont(name: "Aileron-Regular", size: 12.0)
        
        
    }
}

