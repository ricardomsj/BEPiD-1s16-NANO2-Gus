//
//  Guslider.swift
//  Guslider
//
//  Created by Ricardo Marcelo Suman Júnior on 4/14/16.
//  Copyright © 2016 BEPiD. All rights reserved.
//

import UIKit

public class Guslider: UIView {
    
    // First imageView
    public var firstView: UIView
    
    // Second imageView
    public var secondView: UIView
    
    // Slider controller button
    public var sliderController: UIView
    
    /*
     Parameters:
        - frame:      Frame size
        - firstView:  First image view
        - secondView: Second image view
    */
    
    public init(frame: CGRect, firstView: UIView, secondView: UIView) {
        self.firstView = firstView
        self.secondView = secondView
        sliderController = Guslider.prepareSliderController()
        super.init(frame: frame)
        
        initializeView()
        initializeGestureRecognizer()
    }
    
    /**
     Short way to initialize SlidableView. You need target size and images.
     
     - parameter frame:       Frame size
     - parameter firstImage:  First image for sliding
     - parameter secondImage: Second image for sliding
     
     - returns: instance
     */
    convenience public init(frame: CGRect, firstImage: UIImage, secondImage: UIImage) {
        let firstView = UIImageView(frame: frame)
        firstView.image = UIImage(named: "photo")
        firstView.contentMode = .ScaleAspectFill
        
        let secondView = UIImageView(frame: frame)
        secondView.image = UIImage(named: "draw")
        secondView.contentMode = .ScaleAspectFill
        
        self.init(frame: frame, firstView: firstView, secondView: secondView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Typicaly this method is used by gesture recognizer, but you can use it for first state or animations
     
     - parameter maskLocation: x-axis location in frame, where image should be slided
     */
    public func updateMask(maskLocation: CGFloat) {
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