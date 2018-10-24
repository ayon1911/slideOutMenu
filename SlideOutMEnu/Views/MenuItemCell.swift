//
//  MenuItemCell.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 24.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class IconImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 42, height: 42)
    }
}

class MenuItemCell: UITableViewCell {
    
    var iconImageView: IconImageView = {
        let iv = IconImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .orange
        titleLabel.text = "Profile"
        iconImageView.image = UIImage(named: "profile-1.png")
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, UIView()])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension UITableViewCell {
    static var identifire: String {
        return String(describing: self)
    }
}
