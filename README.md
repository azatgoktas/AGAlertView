# AGAlertView

[![CI Status](https://img.shields.io/travis/azattgoktas@gmail.com/AGAlertView.svg?style=flat)](https://travis-ci.org/azattgoktas@gmail.com/AGAlertView)
[![Version](https://img.shields.io/cocoapods/v/AGAlertView.svg?style=flat)](https://cocoapods.org/pods/AGAlertView)
[![License](https://img.shields.io/cocoapods/l/AGAlertView.svg?style=flat)](https://cocoapods.org/pods/AGAlertView)
[![Platform](https://img.shields.io/cocoapods/p/AGAlertView.svg?style=flat)](https://cocoapods.org/pods/AGAlertView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 9 or newer


## Installation

AGAlertView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AGAlertView'
```

## Author

Azat Goktas, azattgoktas@gmail.com

## How To Use
Import The AGAlertView

```swift
import AGAlertView
```
Adding Button.

```swift
let button1 = AGButton(frame: .zero, title: "Button1")
AGAlert().showAlert(title: "Hey Yo", subtitle: "Thats it", buttons: button1)
```
Adding button and custom image. You can simply add action to your button.

```swift
let button1 = AGButton(frame: .zero, title: "Button1")
let button2 = AGButton(title: "Button2", selector: #selector(buttonTapped), target: self)
AGAlert().showAlert(title: "Hey Yo", subtitle: "Thats it", buttons: button1,button2, image: UIImage(named: "frog"))
```
Adding button with type of cancel.

```swift
let button1 = AGButton(frame: .zero, title: "Button1")
let button2 = AGButton(title: "Cancel",buttonStyle: .cancel)
AGAlert().showAlert(title: "Hey Yo", subtitle: "Thats it", buttons: button2,button1)
```
## License

AGAlertView is available under the MIT license. See the LICENSE file for more info.
