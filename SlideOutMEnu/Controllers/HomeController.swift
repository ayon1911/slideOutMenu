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
    
    @objc func handleOpen() {
        
        sliderVC.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(sliderVC.view)
        //sliding out---
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.sliderVC.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0)
        })
        addChild(sliderVC)
    }
    @objc func handleHide() {
        //sliding in--
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.sliderVC.view.transform = .identity
        })
    }
    
    fileprivate func setupNavigation() {
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
}


