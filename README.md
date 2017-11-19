# D2PDatePicker

[![CI Status](http://img.shields.io/travis/di2pra/D2PDatePicker.svg?style=flat)](https://travis-ci.org/di2pra/D2PDatePicker)
[![Version](https://img.shields.io/cocoapods/v/D2PDatePicker.svg?style=flat)](http://cocoapods.org/pods/D2PDatePicker)
[![License](https://img.shields.io/cocoapods/l/D2PDatePicker.svg?style=flat)](http://cocoapods.org/pods/D2PDatePicker)
[![Platform](https://img.shields.io/cocoapods/p/D2PDatePicker.svg?style=flat)](http://cocoapods.org/pods/D2PDatePicker)

<table>
  <tr>
    <th><img alt="Screenshot 1" src="https://github.com/di2pra/D2PDatePicker/blob/master/image/screen_1.png" width="300"></th>
    <th><img alt="Screenshot 1" src="https://github.com/di2pra/D2PDatePicker/blob/master/image/demo.gif" width="300"></th>
    <th><img alt="Screenshot 2" src="https://github.com/di2pra/D2PDatePicker/blob/master/image/screen_2.png" width="300"></th>
  </tr>
</table>


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Example Code: Programmatical Initialization
```Swift

import D2PDatePicker

class ViewController: UIViewController {
    
    var datePickerView: D2PDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Init DatePickerView
        datePickerView = D2PDatePicker(frame: .zero, date: Date())
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the Delegate
        datePickerView.delegate = self
        self.view.addSubview(datePickerView)
        
        self.view.addConstraints([
            NSLayoutConstraint(item: datePickerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: datePickerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200),
            NSLayoutConstraint(item: datePickerView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: datePickerView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: D2PDatePickerDelegate {
    
    func didChange(toDate date: Date) {
        print(date)
    }
    
}
```
## Documentation
All of the methods and properties available for **D2PDatePicker** are documented below.

### Changing the Main Color
##### The `mainColor` Property
Use the mainColor property of `D2PDatePicker` to change the color.
Example usage:
```Swift
self.datePickerView.mainColor = .red
```

### Delegate
**D2PDatePicker** uses a delegate to receive date change events. The delegate object must conform to the `D2PDatePickerDelete` protocol, which is composed of the method:

- `didChange(toDate date: Date)`
Tells the delegate that the selected the date get updated.

## Requirements

No Requirements

## Installation

D2PDatePicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'D2PDatePicker'
```

## Author

[Di2pra](https://twitter.com/di2pra) [LinkedIn](https://www.linkedin.com/in/di2pra/)

## Credits

Credit to http://felicegattuso.com/projects/datedropper/ for the inspiration

## License

D2PDatePicker is available under the MIT license. See the LICENSE file for more info.
