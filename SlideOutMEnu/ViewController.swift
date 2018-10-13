//
//  ViewController.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 13.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
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
        print("Opening menu")
    }
    @objc func handleHide() {
        print("Hiding menu")
    }
    
    fileprivate func setupNavigation() {
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
}


