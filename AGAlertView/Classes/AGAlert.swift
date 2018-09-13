//
//  AlertVC.swift
//  Alert
//
//  Created by Azat Goktas on 11.09.2018.
//  Copyright © 2018 Azat Goktas. All rights reserved.
//

import UIKit


public class AGAlert: UIViewController,AGButtonDelegate {
    
    fileprivate let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let closeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(cancelImg, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    fileprivate let imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.image = alertImg
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    fileprivate let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        lbl.textColor = UIColor.AGAlert.darkGray
        return lbl
    }()
    
    fileprivate let subTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.AGAlert.lightGray
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "AvenirNext-Medium", size: 15)
        return lbl
    }()
    
    fileprivate let button: AGButton = {
        let btn = AGButton(title: "Hey")
        btn.setTitleColor(UIColor.AGAlert.darkGray, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public static var alertImg: UIImage? {
        let bundle = Bundle(for: self)
        return UIImage(named: "nature", in: bundle, compatibleWith: nil)
    }
    
    public static var cancelImg: UIImage? {
        let bundle = Bundle(for: self)
        return UIImage(named: "cancel", in: bundle, compatibleWith: nil)
    }
    
    private let stackView: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.axis = .vertical
        st.alignment = .fill
        st.distribution = .equalCentering
        return st
    }()
    
    private let labelStackView: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.axis = .vertical
        st.alignment = .fill
        st.distribution = .fillEqually
        st.spacing = 10
        return st
    }()
    
    fileprivate var window: UIWindow!
    fileprivate var selfRefence: AGAlert!
    fileprivate var buttons = [AGButton]()
    fileprivate var topConstraint: NSLayoutConstraint!
    fileprivate var bottomConstraint: NSLayoutConstraint!
    
    public func showAlert(title:String, subtitle: String, buttons: AGButton...,image: UIImage? = nil) {
        
        window = UIApplication.shared.keyWindow! as UIWindow
        view.frame = window.bounds
        window.addSubview(view)
        selfRefence = self
        self.buttons = buttons
        self.titleLabel.text = title
        self.subTitleLabel.text = subtitle
        
        if image != nil {
            self.imageView.image = image
        }
        
        setupContentView()
        
        closeButton.addTarget(self, action: #selector(selfRefence.cancelButtonTapped), for: .touchUpInside)
        
    }
    
    fileprivate func setupContentView() {
        view.addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        animateContentView()
        addCloseButton()
        addStackView()
    }
    
    fileprivate func addCloseButton() {
        
        contentView.addSubview(closeButton)
        
        closeButton.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    
    fileprivate func addStackView() {
        contentView.addSubview(stackView)
        addContentView()
        contentView.addConstraintWithVisualFormat(format: "H:|-20-[v0]-20-|", views: stackView)
        contentView.addConstraintWithVisualFormat(format: "V:|-20-[v0]-20-|", views: stackView)
        
        addTitleLabel()
        addSubTitleLabel()
        addImageView()
        addButton()
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.deactivate([topConstraint,bottomConstraint])
        addContentView()
        
        self.view.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(tap:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    fileprivate func addTitleLabel() {
        labelStackView.addArrangedSubview(titleLabel)
    }
    
    fileprivate func addSubTitleLabel() {
        labelStackView.addArrangedSubview(subTitleLabel)
        stackView.addArrangedSubview(labelStackView)
    }
    
    fileprivate func addImageView() {
        stackView.addArrangedSubview(imageView)
    }
    
    fileprivate func addButton() {
        let buttonStackView = UIStackView()
        buttonStackView.backgroundColor = .red
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        _ = buttons.map({
            buttonStackView.addArrangedSubview($0)
            $0.buttonDelegate = self
        })
        
        stackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.heightAnchor.constraint(equalToConstant: contentView.frame.height / 7).isActive = true
    }
    
    fileprivate func addContentView(){
        contentView.center = view.center
        let size = view.frame.size.height / CGFloat(5)
        
        topConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: size)
        bottomConstraint = contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -size)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint])
        view.addConstraintWithVisualFormat(format: "H:|-0-[v0]-0-|", views: contentView)
        self.view.layoutIfNeeded()
    }
    
    fileprivate func animateContentView() {
        UIView.animate(withDuration: 0.4, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },completion: nil)
    }
    
    @objc fileprivate func viewTapped(tap: UITapGestureRecognizer){
        let view = tap.view
        let loc = tap.location(in: view)
        let subview = view?.hitTest(loc, with: nil)
        if subview == self.view{
            hideView()
        }
    }
    
    
    @objc fileprivate func cancelButtonTapped() {
        hideView()
    }
    
    func didTapButton() {
        hideView()
    }
    
    @objc fileprivate func hideView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.contentView.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
            self.contentView.alpha = 0
        }) { (finished) in
            self.view.removeFromSuperview()
        }
    }
    
}



