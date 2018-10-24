//
//  ListVC.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 24.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class ListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let label = UILabel()
        label.text = "Lists"
        label.font = UIFont.systemFont(ofSize: 33, weight: .heavy)
        label.frame = CGRect(x: view.center.x - 50, y: view.center.y - 50, width: 100, height: 100)
        view.addSubview(label)
        
    }

}
