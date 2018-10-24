//
//  BookmarksVCTableViewController.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 24.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class BookmarksVC: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: UITableViewCell.identifire)
        cell.textLabel?.text = "Bookmark \(indexPath.row)"
        return cell
    }

}
