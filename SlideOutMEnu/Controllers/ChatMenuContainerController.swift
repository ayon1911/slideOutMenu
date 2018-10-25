//
//  ChatMenuContainerController.swift
//  SlideOutMEnu
//
//  Created by Khaled Rahman Ayon on 25.10.18.
//  Copyright © 2018 DocDevs. All rights reserved.
//

import UIKit

class ChatMenuContainerController: UIViewController {

    let chatMenuContoller = ChatMenuController()
    let searchContainer = SearchContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        
        searchContainer.searchBar.delegate = chatMenuContoller
    }
    
    fileprivate func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.4274509804, blue: 0.8784313725, alpha: 1)
        
        let chatMenuControllerView = chatMenuContoller.view!
        view.addSubview(chatMenuControllerView)
        
        view.addSubview(searchContainer)
        searchContainer.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        
        searchContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        chatMenuControllerView.anchor(top: searchContainer.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
