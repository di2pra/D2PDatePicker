//
//  AnimateView.swift
//  DatePicker
//
//  Created by Pradheep Rajendirane on 10/08/2017.
//  Copyright © 2017 DI2PRA. All rights reserved.
//

import UIKit

class AnimateView: UIView {
    
    @IBOutlet weak var contentView:UIView!
    
    var imageView:UIImageView!
    var isAnimating: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func setup() {
        imageView = UIImageView(frame: .zero)
        imageView.contentMode = .center
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layoutAttachAll(to: self)
        self.sendSubview(toBack: imageView)
        imageView.isHidden = true
    }
    
    func animate(direction: AnimationDirection) {
        
        if !isAnimating {
            
            isAnimating = true
            
            // move the contentview depending the direction
            if direction == .backward {
                self.contentView.transform = .init(translationX: 0, y: self.frame.height)
            } else if direction == .forward {
                self.contentView.transform = .init(translationX: 0, y: -self.frame.height)
            }
            
            
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                
                
                if direction == .backward {
                    self.transform = .init(translationX: 0, y: -self.frame.height)
                } else if direction == .forward {
                    self.transform = .init(translationX: 0, y: self.frame.height)
                }
                
                self.imageView.alpha = 0.0
                self.contentView.alpha = 1.0
                
            }) { (terminated) in
                
                self.isAnimating = false
                
                if terminated {
                    
                    self.contentView.transform = .identity
                    self.transform = .identity
                    
                    self.imageView.alpha = 0.0
                    self.imageView.isHidden = true
                    self.contentView.alpha = 1.0
                    
                }
                
            }

            
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

enum AnimationDirection {
    case backward, forward, identity
}
