//
//  AGAlertExtensions.swift
//  Alert
//
//  Created by Azat Goktas on 12.09.2018.
//  Copyright © 2018 Azat Goktas. All rights reserved.
//

import UIKit

extension UIView{
    public func addConstraintWithVisualFormat(format: String, views : UIView...) {
        var viewDictionary = [String: UIView]()
        
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            viewDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}

public extension UIColor {
    struct AGAlert {
        static var darkGray: UIColor  { return UIColor(red: 58.0 / 255, green: 60.0 / 255, blue: 67.0 / 255, alpha: 1.0) }
        static var lightGray: UIColor { return UIColor(red: 218.0/255, green: 218.0/255, blue: 218.0/255, alpha: 1) }
        static var cancelBlue: UIColor { return UIColor(red: 79.0/255, green: 157.0/255, blue: 222.0/255, alpha: 1) }
    }
}
