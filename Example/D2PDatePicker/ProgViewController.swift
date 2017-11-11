//
//  ProgViewController.swift
//  DatePicker
//
//  Created by Pradheep Rajendirane on 11/11/2017.
//  Copyright © 2017 Pradheep Rajendirane. All rights reserved.
//

import UIKit
import D2PDatePicker

class ProgViewController: UIViewController {
    
    var datePickerView: D2PDatePicker!
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
        
        datePickerView = D2PDatePicker(frame: .zero, date: initDate)
        datePickerView.delegate = self
        self.view.addSubview(datePickerView)
        
        self.view.addConstraints([
            NSLayoutConstraint(item: datePickerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: datePickerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200),
            NSLayoutConstraint(item: datePickerView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: datePickerView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
            ])
        
        
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

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ProgViewController: D2PDatePickerDelegate {
    func didChange(toDate date: Date) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        dateLabel.text = formatter.string(from: date)
    }
}
