//
//  ViewController.swift
//  DatePicker
//
//  Created by Pradheep Rajendirane on 11/11/2017.
//  Copyright © 2017 Pradheep Rajendirane. All rights reserved.
//

import UIKit
import D2PDatePicker

class ViewController: UIViewController {
    
    @IBOutlet weak var datePickerView:D2PDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var colors: [UIColor] = [
        UIColor(hex: "FD4741"),
        UIColor(hex: "8e44ad"),
        UIColor(hex: "2ecc71"),
        UIColor(hex: "3498db"),
        UIColor(hex: "c0392b"),
        UIColor(hex: "1abc9c"),
        UIColor(hex: "2c3e50")
    ]
    
    var initDate:Date! = Date() // init Date Today
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePickerView.delegate = self
        btn.addTarget(self, action: #selector(self.setDate), for: .touchUpInside)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = formatter.string(from: initDate)
        
        
        for color in colors {
            
            let btn = UIButton(frame: .zero)
            btn.backgroundColor = color
            btn.layer.cornerRadius = 5.0
            btn.addTarget(self, action: #selector(self.changeColor), for: .touchUpInside)
            stackView.insertArrangedSubview(btn, at: stackView.arrangedSubviews.count)
            
        }
    }
    
    @objc func changeColor(sender: UIButton) {
        
        if let index = stackView.arrangedSubviews.index(of: sender) {
            self.datePickerView.mainColor = colors[index]
        }
    }
    
    @objc func setDate() {
        datePickerView.set(toDate: Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: D2PDatePickerDelegate {
    func didChange(toDate date: Date) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        dateLabel.text = formatter.string(from: date)
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
