//
//  CustomSliderHeaderView.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 24.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class CustomSliderHeaderView: UIView {

    let nameLable = UILabel()
    let usernameLabel = UILabel()
    let statslabel = UILabel()
    let profileImageView = ProfileImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
        setupStackViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- initial setups
    fileprivate func setupComponents() {
        backgroundColor = .white
        nameLable.text = "Ayon"
        nameLable.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        usernameLabel.text = "@takeMyMoney"
        statslabel.text = "42 Following 7089 Followers"
        profileImageView.image = UIImage(named: "profile")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .red
        
        setupAttributedText()
    }
    fileprivate func setupStackViews() {
        let arrangedSubViews = [
            UIView(), UIStackView(arrangedSubviews: [profileImageView, UIView()]), nameLable, usernameLabel, CustomSpaceView(space: 16), statslabel
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    fileprivate func setupAttributedText() {
        statslabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let attributedText = NSMutableAttributedString(string: "42 "  , attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)])
        attributedText.append(NSAttributedString(string: "Following  ", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "7095 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]))
        attributedText.append(NSAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
        statslabel.attributedText = attributedText
    }
}
