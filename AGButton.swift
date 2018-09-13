//
//  AGButton.swift
//  Alert
//
//  Created by Azat Goktas on 11.09.2018.
//  Copyright © 2018 Azat Goktas. All rights reserved.
//

import UIKit

public enum AGButtonStyle {
    case cancel, standard
}

protocol AGButtonDelegate {
    func didTapButton()
}

public class AGButton: UIButton {
    
    fileprivate var target:AnyObject!
    fileprivate var selector:Selector!
    fileprivate var buttonStyle = AGButtonStyle.standard
    
    var buttonDelegate: AGButtonDelegate?
    
    override public func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    public init(frame: CGRect = .zero ,title: String, buttonStyle: AGButtonStyle = .standard) {
        super.init(frame: frame)
        self.setTitle(title, for: .normal)
        self.addTarget(self, action:#selector(buttonTapped), for:.touchUpInside)
        self.buttonStyle = buttonStyle
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(frame: CGRect = .zero ,title: String,selector: Selector,target: AnyObject, buttonStyle: AGButtonStyle = .standard) {
        super.init(frame: frame)
        self.setTitle(title, for: .normal)
        self.selector = selector
        self.target = target
        self.buttonStyle = buttonStyle
        self.addTarget(self, action:#selector(buttonTappedWithTarget(sender:)), for:.touchUpInside)
    }
    
    @objc func buttonTappedWithTarget (sender: AGButton) {
        let control = UIControl()
        control.sendAction(self.selector, to: self.target, for: nil)
        buttonDelegate?.didTapButton()
    }
    
    @objc func buttonTapped () {
        buttonDelegate?.didTapButton()
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 2
        
        if buttonStyle == .cancel {
            self.backgroundColor = UIColor.AGAlert.lightGray
            self.layer.borderColor = UIColor.AGAlert.lightGray.cgColor
            setTitleColor(UIColor.white, for: .normal)
        }else {
            self.layer.borderColor = UIColor.AGAlert.lightGray.cgColor
            setTitleColor(UIColor.AGAlert.darkGray, for: .normal)
        }
        
        self.clipsToBounds = true
    }
    
    
}
