//
//  BaseSliderVC.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 21.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class BaseSliderVC: UIViewController {
    //MARK:- variables
    let redView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let blueView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    fileprivate let menuWidth: CGFloat = 300
    var redViewLeadingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        
        setupViews()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    //MARK:- handler
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let traslation = gesture.translation(in: view)
        var x = traslation.x
        x = min(menuWidth, x)
        redViewLeadingConstraint.constant = x
        print(traslation.x)
    }
    
    //MARK:- fileprivate
    fileprivate func setupViews() {
        //use auto layout
        view.addSubview(redView)
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 0)
            ])
        self.redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.isActive = true
    }
}

