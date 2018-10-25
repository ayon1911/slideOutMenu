//
//  ChatMenuController.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 25.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class ChatMenuController: UITableViewController {
    
    let chatRoomGroups = [
        ["general", "introduction"],
        ["jobs"],
        ["Ayon", "Jobs", "Cook", "Gates"]
    ]

    var filteredResults = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filteredResults = chatRoomGroups
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.4274509804, blue: 0.8784313725, alpha: 1)
    }

    // MARK: - Table view data source
    fileprivate class ChatRoomHeaderLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
            
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = ChatRoomHeaderLabel()
        let text = section == 0 ? "UNREAD" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
        label.text = text
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.4274509804, blue: 0.8784313725, alpha: 1)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredResults.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredResults[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatMenuCells(style: .default, reuseIdentifier: nil)
        let text = filteredResults[indexPath.section][indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [.foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSAttributedString(string: text, attributes: [.foregroundColor: UIColor.white]))
        cell.textLabel?.attributedText = attributedText
        return cell
    }
}

extension ChatMenuController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredResults = chatRoomGroups
            tableView.reloadData()
            return
        }
        
        filteredResults = chatRoomGroups.map({ (group) -> [String] in
            return group.filter({$0.lowercased().contains(searchText.lowercased())})
        })
        tableView.reloadData()
    }
}
