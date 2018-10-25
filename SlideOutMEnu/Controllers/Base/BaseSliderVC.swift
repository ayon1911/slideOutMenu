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
    var rightViewController: UIViewController = UINavigationController(rootViewController: HomeController())
    let sliderVC = ChatMenuContainerController()

    let rightView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let leftView: UIView = {
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
    var redViewTrailingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setupViews()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        darkView.addGestureRecognizer(tapGesture)
    }
    
    //MARK:- handler
    @objc func handleTapDismiss(gesture: UITapGestureRecognizer) {
        closeSlider()
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let traslation = gesture.translation(in: view)
        var x = traslation.x
        
        x = isSliderOpen ? x + menuWidth : x
        x = min(menuWidth, x)
        x = max(0, x)
        
        redViewLeadingConstraint.constant = x
        redViewTrailingConstraint.constant = x
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
    func openSlider() {
        isSliderOpen = true
        redViewLeadingConstraint.constant = menuWidth
        redViewTrailingConstraint.constant = menuWidth
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func closeSlider() {
        isSliderOpen = false
        redViewLeadingConstraint.constant = 0
        redViewTrailingConstraint.constant = 0
        performAnimations()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isSliderOpen ?.lightContent : .default
    }
    
    func didSelectMenuItem(indexPath: IndexPath) {
        removeViewsWithControllers()
        closeSlider()
        
        switch indexPath.row {
        case 0:
            rightViewController = UINavigationController(rootViewController: HomeController())
            
        case 1:
            rightViewController = UINavigationController(rootViewController: ListVC())
            
        case 2:
            rightViewController = BookmarksVC()
        default:
            let tabBarController = UITabBarController()
            let momentsController = UIViewController()
            momentsController.navigationItem.title = "Moments"
            let navController = UINavigationController(rootViewController: momentsController)
            navController.tabBarItem.title = "Moments"
            momentsController.view.backgroundColor = .orange
            tabBarController.viewControllers = [navController]
            rightViewController = tabBarController
        }
        rightView.addSubview(rightViewController.view)
        addChild(rightViewController)
        
        rightView.bringSubviewToFront(darkView)
    }
    
    fileprivate func removeViewsWithControllers() {
        rightViewController.view.removeFromSuperview()
        rightViewController.removeFromParent()
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
        view.addSubview(rightView)
        view.addSubview(leftView)
        
        NSLayoutConstraint.activate([
            rightView.topAnchor.constraint(equalTo: view.topAnchor),
            rightView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            leftView.topAnchor.constraint(equalTo: view.topAnchor),
            leftView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor),
            leftView.widthAnchor.constraint(equalToConstant: menuWidth),
            leftView.bottomAnchor.constraint(equalTo: rightView.bottomAnchor)
            ])
        redViewLeadingConstraint = rightView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewTrailingConstraint = rightView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        redViewLeadingConstraint.isActive = true
        redViewTrailingConstraint.isActive = true
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers() {
        
        let homeView = rightViewController.view!
        let sliderView = sliderVC.view!
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        rightView.addSubview(homeView)
        rightView.addSubview(darkView)
        leftView.addSubview(sliderView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: rightView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: rightView.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: rightView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: rightView.trailingAnchor),
            
            sliderView.topAnchor.constraint(equalTo: leftView.topAnchor),
            sliderView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor),
            sliderView.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
            sliderView.trailingAnchor.constraint(equalTo: leftView.trailingAnchor),
            
            darkView.topAnchor.constraint(equalTo: rightView.topAnchor),
            darkView.leadingAnchor.constraint(equalTo: rightView.leadingAnchor),
            darkView.bottomAnchor.constraint(equalTo: rightView.bottomAnchor),
            darkView.trailingAnchor.constraint(equalTo: rightView.trailingAnchor)
            ])
        addChild(rightViewController)
        addChild(sliderVC)
    }
}

