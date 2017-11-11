//
//  UIView.swift
//  DatePicker
//
//  Created by Pradheep Rajendirane on 11/11/2017.
//  Copyright © 2017 Pradheep Rajendirane. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult   // 1
    func fromNib<T : UIView>() -> T? {   // 2
        
        let bundle = Bundle(for: type(of: self))
        
        guard let view = bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?[0] as? T else {    // 3
            // xib not loaded, or it's top view is of the wrong type
            return nil
        }
        self.addSubview(view)     // 4
        view.translatesAutoresizingMaskIntoConstraints = false   // 5
        view.layoutAttachAll(to: self)   // 6
        return view   // 7
    }
    
    public func layoutAttachAll(to childView:UIView)
    {
        var constraints = [NSLayoutConstraint]()
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(NSLayoutConstraint(item: childView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: childView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: childView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        childView.addConstraints(constraints)
    }
    
    
    func takeScreenshot() -> UIImage {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}
