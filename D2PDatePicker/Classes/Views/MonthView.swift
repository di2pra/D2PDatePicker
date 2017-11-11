//
//  MonthView.swift
//  Token
//
//  Created by Pradheep Rajendirane on 10/08/2017.
//  Copyright © 2017 DI2PRA. All rights reserved.
//

import UIKit

class MonthView: AnimateView {
    
    @IBOutlet weak var monthLabel:UILabel!
    
    
    func anim(direction: AnimationDirection, date: Date) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        
        var newDate:Date
        
        if direction == .backward {
            newDate = Calendar.current.date(byAdding: .month, value: -1, to: date)!
        } else if direction == .forward {
            newDate = Calendar.current.date(byAdding: .month, value: 1, to: date)!
        } else {
            newDate = date
        }
        
        
        // Init animation
        
        
        if !isAnimating {
            // take a screenshot of the uivew and then show
            self.imageView.image = self.contentView.takeScreenshot()
            self.imageView.alpha = 1.0
            self.imageView.isHidden = false
            
            // hide the contentview and move it
            self.contentView.alpha = 0.0
            self.monthLabel.text = dateFormatter.string(from: newDate)
            
            super.animate(direction: direction)
            
            return newDate
            
        }
        
        
        return date
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
