//
//  MyTrainersSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-18.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class MyTrainersSegmentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TrainerCell.self, forCellReuseIdentifier: "TrainerCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 2.0).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        tableView.rowHeight = 120
        tableView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 3.0)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.rowHeight = 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainerCell", for: indexPath) as! TrainerCell
        
        cell.imageView?.image = #imageLiteral(resourceName: "sample_image.png")
        cell.nameLbl.text = "Johnathan Smith"
        cell.locationLbl.text = "5km away"
        
        return cell
        
    }

  
}
