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
    
    let darkView: UIView = {
       let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 0.7)
        v.alpha = 0
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    fileprivate let menuWidth: CGFloat = 300
    fileprivate let velocityThreshold: CGFloat = 500
    fileprivate var isSliderOpen = false
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
        
        x = isSliderOpen ? x + menuWidth : x
        x = min(menuWidth, x)
        x = max(0, x)
        
        redViewLeadingConstraint.constant = x
        darkView.alpha = x / menuWidth
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
        print(traslation.x)
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let traslation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isSliderOpen {
            if abs(velocity.x) > velocityThreshold {
                closeSlider()
                return
            }
            if abs(traslation.x) < menuWidth / 2 {
                openSlider()
            }
            else {
                closeSlider()
            }
        } else {
            if (velocity.x) > velocityThreshold {
                openSlider()
                return
            }
            if traslation.x < menuWidth / 2 {
                closeSlider()
            } else {
                openSlider()
            }
        }
    }
    
    //MARK:- open, close and perform slider
    fileprivate func openSlider() {
        isSliderOpen = true
        redViewLeadingConstraint.constant = menuWidth
        performAnimations()
    }
    
    fileprivate func closeSlider() {
        isSliderOpen = false
        redViewLeadingConstraint.constant = 0
        performAnimations()
    }
    
    fileprivate func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.darkView.alpha = self.isSliderOpen ? 1 : 0
        }, completion: nil)
    }
    

    //MARK:- setupViews and Controllers
    fileprivate func setupViews() {
        //use auto layout
        view.addSubview(redView)
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor)
            ])
        self.redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.isActive = true
        
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers() {
        let homeVC = HomeController()
        let sliderVC = SliderController()
        
        let homeView = homeVC.view!
        let sliderView = sliderVC.view!
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.addSubview(homeView)
        redView.addSubview(darkView)
        blueView.addSubview(sliderView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            
            sliderView.topAnchor.constraint(equalTo: blueView.topAnchor),
            sliderView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
            sliderView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            sliderView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),
            
            darkView.topAnchor.constraint(equalTo: redView.topAnchor),
            darkView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            darkView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            darkView.trailingAnchor.constraint(equalTo: redView.trailingAnchor)
            ])
        addChild(homeVC)
        addChild(sliderVC)
    }
}

