//
//  NewFile.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 25.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class SearchContainerView: UIView {
    
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        sb.placeholder = "Enter some filter"
        return sb
    }()
    
    let iconImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "profile-1"))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
        
        addSubview(searchBar)
        addSubview(iconImageView)
        
        iconImageView.anchor(top: nil, leading: safeAreaLayoutGuide.leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 10, right: 0), size: .init(width: 44, height: 44))
        
        searchBar.anchor(top: nil, leading: iconImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 4, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
