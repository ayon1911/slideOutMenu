//
//  CustomSpaceView.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 24.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class CustomSpaceView: UIView {
    
    let space: CGFloat

    override var intrinsicContentSize: CGSize {
        return .init(width: space, height: space)
    }
    
    init(space: CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
