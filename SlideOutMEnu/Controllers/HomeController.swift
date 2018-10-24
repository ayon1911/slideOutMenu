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
        (UIApplication.shared.keyWindow?.rootViewController as? BaseSliderVC)?.openSlider()
    }
    
    @objc func handleHide() {
        //sliding in--
        (UIApplication.shared.keyWindow?.rootViewController as? BaseSliderVC)?.closeSlider()

    }
    
    //MARK:- fileprivate Functions
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
}

