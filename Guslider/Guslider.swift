//
//  Guslider.swift
//  Guslider
//
//  Created by Ricardo Marcelo Suman Júnior on 4/14/16.
//  Copyright © 2016 BEPiD. All rights reserved.
//

import UIKit

class Guslider: UIView {
    
    // First imageView
    internal var firstView: UIView
    
    // Second imageView
    internal var secondView: UIView
    
    // Slider controller button
    internal var sliderController: UIView
    
    /*
     Parameters:
        - frame:      Frame size
        - firstView:  First image view
        - secondView: Second image view
    */
    
    internal init(frame: CGRect, firstView: UIView, secondView: UIView) {
        self.firstView = firstView
        self.secondView = secondView
        sliderController = Guslider.prepareSliderController()
        super.init(frame: frame)
        
        initializeView()
        initializeGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Typicaly this method is used by gesture recognizer, but you can use it for first state or animations
     
     - parameter maskLocation: x-axis location in frame, where image should be slided
     */
    internal func updateMask(maskLocation: CGFloat) {
        let maskRectPath = UIBezierPath(rect: CGRect(x: self.bounds.minX, y: bounds.minY, width: maskLocation, height: bounds.height))
        let mask = CAShapeLayer()
        mask.path = maskRectPath.CGPath
        secondView.layer.mask = mask
        
        sliderController.center.x = maskLocation
    }
    
    // Setup view
    private func initializeView() {
        clipsToBounds = true
        sliderController.center = firstView.center
        
        print("slider: ", sliderController.center)
        print("view: \(firstView.center)")
        
        //sliderController.center = firstView.center
        updateMask(center.x)
        
        addSubview(firstView)
        addSubview(secondView)
        addSubview(sliderController)
    }
    
    // Add gesture recognizer
    private func initializeGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gestureHandler))
        sliderController.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func gestureHandler(panGestureRecognizer: UIPanGestureRecognizer) {
        let location = panGestureRecognizer.locationInView(firstView)
        
        if !(self.bounds.minX ... self.bounds.maxX ~= location.x) {
            return
        }
        
        updateMask(location.x)
        
    }
    
    // Setup slider button
    private class func prepareSliderController() -> UIView {
        
        let imageView = UIImageView(image: UIImage(named: "button"))
        
        let circle = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        circle.layer.cornerRadius = circle.bounds.width / 2
        
        
        circle.addSubview(imageView)
        
        return circle
    }
}