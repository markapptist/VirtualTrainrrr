//
//  TrainerSessionsSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerSessionsSegmentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    let trainerMeetUp = TrainerMeetUpVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.darkGray
        
        tableView.register(SessionsCell.self, forCellReuseIdentifier: "SessionsCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 2.0).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        tableView.rowHeight = 120
        tableView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2.0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.rowHeight = 120
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionsCell", for: indexPath) as! SessionsCell
   
        cell.backgroundColor = UIColor.darkGray
        
        cell.priceBtn.addTarget(self, action: #selector(sessionBtnPressed), for: .touchUpInside)
        
        return cell
        
    }
    
    func sessionBtnPressed() {
        
        present(TrainerMeetUpVC(), animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
