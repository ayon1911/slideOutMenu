//
//  ViewController.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 13.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    //variables
    let sliderVC = SliderController()
    fileprivate let menuWidth: CGFloat = 300
    fileprivate let velocityThreshold: CGFloat = 500
    fileprivate var sliderOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        setupNavigation()
        setupSliderController()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Rows: \(indexPath.row)"
        
        return cell
    }
    //MARK:- controller handler
    @objc func handleOpen() {
        //sliding out---
        sliderOpened = true
        performAnimation(trasnform: CGAffineTransform(translationX: self.menuWidth, y: 0))
    }
    
    @objc func handleHide() {
        //sliding in--
        sliderOpened = false
        performAnimation(trasnform: .identity)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let traslation = gesture.translation(in: view)
        if gesture.state == .changed {
            var varingX = traslation.x
            if sliderOpened {
                varingX += menuWidth
            }
            varingX = min(menuWidth, varingX)
            varingX = max(0, varingX)
            let transformX = CGAffineTransform(translationX: varingX, y: 0)
            sliderVC.view.transform = transformX
            navigationController?.view.transform = transformX
        } else if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    //MARK:- fileprivate Functions
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let traslation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        if sliderOpened {
            if abs(velocity.x) > velocityThreshold {
                handleHide()
                return
            }
            if abs(traslation.x) < menuWidth / 2 {
                handleOpen()
            } else {
                handleHide()
            }
        } else {
            if velocity.x > velocityThreshold {
                handleOpen()
                return
            }
            if traslation.x < menuWidth / 2 {
                handleHide()
            } else {
                handleOpen()
            }
        }
    }
    
    fileprivate func setupNavigation() {
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    fileprivate func setupSliderController() {
        sliderVC.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(sliderVC.view)
        addChild(sliderVC)
    }
    
    fileprivate func performAnimation(trasnform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.sliderVC.view.transform = trasnform
            self.navigationController?.view.transform = trasnform
        })
    }
}


