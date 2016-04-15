//
//  MenuViewController.swift
//  Guslider
//
//  Created by Ricardo Marcelo Suman Júnior on 4/15/16.
//  Copyright © 2016 BEPiD. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBar.hidden = false
    }

}
