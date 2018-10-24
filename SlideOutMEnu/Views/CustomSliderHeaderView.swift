//
//  CustomSliderHeaderView.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 24.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class CustomSliderHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        let nameLable = UILabel()
        nameLable.text = "Ayon"
        
        let usernameLabel = UILabel()
        usernameLabel.text = "Build it"
        
        let statslabel = UILabel()
        statslabel.text = "42 Following 7089 Followers"
        
        let arrangedSubViews = [
            UIView(), nameLable, usernameLabel, CustomSpaceView(space: 16), statslabel
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
