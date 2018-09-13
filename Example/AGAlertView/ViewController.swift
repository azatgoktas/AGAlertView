//
//  ViewController.swift
//  AGAlertView
//
//  Created by azattgoktas@gmail.com on 09/13/2018.
//  Copyright (c) 2018 azattgoktas@gmail.com. All rights reserved.
//

import UIKit
import AGAlertView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
    }

    @objc func buttonTapped(){
        print("hey")
    }
    
    @IBAction func singleButtonTapped(_ sender: Any) {
        let button1 = AGButton(frame: .zero, title: "Button1")
        AGAlert().showAlert(title: "Hey Yo", subtitle: "Thats it", buttons: button1)
    }
    
    @IBAction func twoButtonTapped(_ sender: Any) {
        let button1 = AGButton(frame: .zero, title: "Button1")
        let button2 = AGButton(title: "Button2", selector: #selector(buttonTapped), target: self)
        AGAlert().showAlert(title: "Hey Yo", subtitle: "Thats it", buttons: button1,button2, image: UIImage(named: "frog"))
    }
    
    @IBAction func withCancelButtonTapped(_ sender: Any) {
        let button1 = AGButton(frame: .zero, title: "Button1")
        let button2 = AGButton(title: "Cancel",buttonStyle: .cancel)
        AGAlert().showAlert(title: "Hey Yo", subtitle: "Thats it", buttons: button2,button1)
    }
    

}

