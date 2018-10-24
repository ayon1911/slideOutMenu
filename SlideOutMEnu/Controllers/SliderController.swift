//
//  SliderController.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 13.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class SliderController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .blue
    }
    //MARK:- header view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customSliderHeaderView = CustomSliderHeaderView()
        return customSliderHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Menu"
        return cell
    }
}
