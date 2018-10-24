//
//  SliderController.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 13.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String
}

class SliderController: UITableViewController {
    
    //MARK:- variables
    let menuItems = [
        MenuItem(icon: #imageLiteral(resourceName: "profile-1"), title: "Profile"),
        MenuItem(icon: #imageLiteral(resourceName: "lists"), title: "List"),
        MenuItem(icon: #imageLiteral(resourceName: "bookmarks"), title: "Bookmark"),
        MenuItem(icon: #imageLiteral(resourceName: "moments"), title: "Moments")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
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
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCell(style: .default, reuseIdentifier: MenuItemCell.identifire)
        let menuItem = menuItems[indexPath.row]
        cell.iconImageView.image = menuItem.icon
        cell.titleLabel.text = menuItem.title
        return cell
    }
}
