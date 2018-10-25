//
//  ChatMenuCells.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 25.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class ChatMenuCells: UITableViewCell {

    let bgView: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.5176470588, green: 0.2156862745, blue: 0.4901960784, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
            ])
        sendSubviewToBack(bgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        bgView.isHidden = !selected
    }

}
