//
//  InboxVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class InboxVC: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let searchBar = UISearchBar()
    let tabSwitch = UISegmentedControl()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.searchBarStyle = .default
        searchBar.isTranslucent = true
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.white
        searchBar.tintColor = UIColor.white
        searchBar.isTranslucent = true
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = UIColor.white
        self.view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        searchBar.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        searchBar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(tabSwitch)
        
        tabSwitch.translatesAutoresizingMaskIntoConstraints = false
        tabSwitch.makeRound()
        tabSwitch.layer.cornerRadius = 5
        tabSwitch.insertSegment(withTitle: "Messages", at: 0, animated: true)
        tabSwitch.insertSegment(withTitle: "Notifications", at: 1, animated: true)
        tabSwitch.setEnabled(true, forSegmentAt: 0)
        tabSwitch.setEnabled(true, forSegmentAt: 1)
        tabSwitch.tintColor = UIColor.init(red: 49/255, green: 108/255, blue: 156/255, alpha: 1.0)
        tabSwitch.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        tabSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tabSwitch.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        tabSwitch.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06).isActive = true
        
        let msgComposeBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "inbox_add_ic.png"), style: .done, target: self, action: #selector(msgComposeBtnPressed))
        msgComposeBtn.tintColor = UIColor.white
        
        self.navigationItem.setRightBarButton(msgComposeBtn, animated: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.darkGray
        
        tableView.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: tabSwitch.bottomAnchor, constant: 5).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 2.0).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        tableView.rowHeight = 120
        tableView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2.0)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        tabSwitch.selectedSegmentIndex = 0
        
        self.tabBarController?.tabBar.isHidden = false 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.rowHeight = 120
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        
        if(indexPath.row % 2 == 0) {
            cell.imageView?.image = #imageLiteral(resourceName: "customer_sample.png")
        } else {
            cell.imageView?.image = #imageLiteral(resourceName: "sample_image.png")
        }

        cell.backgroundColor = UIColor.white
        cell.nameLbl.textColor = UIColor.black
        cell.locationLbl.textColor = UIColor.black
        cell.reviewLbl.textColor = UIColor.black
        cell.dateLbl.textColor = UIColor.black
        cell.star1.isHidden = true
        cell.star2.isHidden = true
        cell.star3.isHidden = true
        cell.star4.isHidden = true
        cell.star5.isHidden = true
        
        

        return cell
        
    }

    
  
    func msgComposeBtnPressed() {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
}
