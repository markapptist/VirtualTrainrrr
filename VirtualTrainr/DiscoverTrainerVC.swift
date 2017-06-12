//
//  DiscoverVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

let secondNotification = Notification.Name("secondNotification")

class DiscoverTrainerVC: UIViewController, UISearchBarDelegate, UITableViewDelegate,
    UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let tableView = UITableView()
    let searchBar = UISearchBar()
    var collectionView: UICollectionView!
    
    let trainerVC = TrainerProfileVC()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layoutA = UICollectionViewFlowLayout()
        layoutA.scrollDirection = .horizontal
        layoutA.itemSize = CGSize(width: 160, height: 250)
        
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layoutA)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(TrainerCollectionViewCell.self, forCellWithReuseIdentifier: "TrainerCollectionCell")
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 3.3).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true 
        
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
        searchBar.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 0).isActive = true
        searchBar.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        searchBar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DiscoverTrainerCell.self, forCellReuseIdentifier: "DiscoverTrainerCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 0).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 2.0).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        tableView.rowHeight = 100
        tableView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2.0)
        
        let applyFilterBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "discover_filter_ic.png"), style: .done, target: self, action: #selector(filterBtnPressed))
        applyFilterBtn.tintColor = UIColor.white
        
        let discoverMapBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "discover_location_ic.png"), style: .done, target: self, action: #selector(discoverBtnPressed))
        discoverMapBtn.tintColor = UIColor.white
        
        self.navigationItem.setRightBarButtonItems([discoverMapBtn, applyFilterBtn], animated: true)
        
        let locationIcon = UIImageView()
        
        self.view.addSubview(locationIcon)
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.image = #imageLiteral(resourceName: "location_ic.png")
        locationIcon.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -15).isActive = true
        locationIcon.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        locationIcon.widthAnchor.constraint(equalToConstant: 12).isActive = true
        locationIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        self.tabBarController?.tabBar.isHidden = false

    }
    
    func filterBtnPressed() {
        NotificationCenter.default.post(name: secondNotification, object: nil, userInfo: nil)
    }
    
    func discoverBtnPressed() {
        let map = DiscoverMapVC()
        self.navigationController?.pushViewController(map, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerCollectionCell", for: indexPath) as! TrainerCollectionViewCell
        
        if(indexPath.row % 2 == 0) {
            cell.imageView.image = #imageLiteral(resourceName: "customer_sample.png")
        } else {
            cell.imageView.image = #imageLiteral(resourceName: "sample_image.png")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchBar.resignFirstResponder()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.rowHeight = 100
        
        searchBar.resignFirstResponder()
        present(trainerVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverTrainerCell", for: indexPath) as! DiscoverTrainerCell
        
        if(indexPath.row % 2 == 0) {
            cell.imageView?.image = #imageLiteral(resourceName: "customer_sample.png")
        } else {
            cell.imageView?.image = #imageLiteral(resourceName: "sample_image.png")
        }
        cell.nameLbl.text = "Johnathan Smith"
        cell.locationLbl.text = "5km away"

        cell.selectionStyle = .none
        
        
        return cell
        
    }

    
}
