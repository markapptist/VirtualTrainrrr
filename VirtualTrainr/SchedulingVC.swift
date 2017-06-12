//
//  SchedulingVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-12.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class SchedulingVC: UIViewController {
    
    let tabSwitch = UISegmentedControl()
    
    let clientTab = UISegmentedControl()
    
    let clientListToday = ClientListTodayVC()
    
    let clientListPending = ClientListPendingVC()
    
    let clientListConfirmed = ClientListConfirmedVC()
    
    let calendarView = MyCalendar()
    
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabSwitch.makeRound()
        self.view.addSubview(tabSwitch)
        tabSwitch.insertSegment(withTitle: "Appointments", at: 0, animated: true)
        tabSwitch.insertSegment(withTitle: "Availability", at: 1, animated: true)
        
        tabSwitch.setEnabled(true, forSegmentAt: 0)
        tabSwitch.setEnabled(true, forSegmentAt: 1)
        tabSwitch.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        tabSwitch.translatesAutoresizingMaskIntoConstraints = false
        tabSwitch.layer.cornerRadius = 5
        tabSwitch.tintColor = UIColor.init(red: 49/255, green: 108/255, blue: 156/255, alpha: 1.0)
        tabSwitch.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 15).isActive = true
        tabSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tabSwitch.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        tabSwitch.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        
        self.view.addSubview(containerView)
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.tabSwitch.bottomAnchor, constant: 5).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        clientTab.makeRound()
        containerView.addSubview(clientTab)
        clientTab.insertSegment(withTitle: "Today", at: 0, animated: true)
        clientTab.insertSegment(withTitle: "Pending", at: 1, animated: true)
        clientTab.insertSegment(withTitle: "Confirmed", at: 2, animated: true)
        clientTab.isHidden = true
        clientTab.setEnabled(true, forSegmentAt: 0)
        clientTab.setEnabled(true, forSegmentAt: 1)
        clientTab.setEnabled(true, forSegmentAt: 2)
        
        clientTab.addTarget(self, action: #selector(clientTabIndexChanged), for: .valueChanged)
        clientTab.translatesAutoresizingMaskIntoConstraints = false
        clientTab.layer.cornerRadius = 7
        clientTab.tintColor = UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
        clientTab.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        clientTab.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        clientTab.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        clientTab.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        self.tabBarController?.tabBar.isHidden = false
        
        tabSwitch.selectedSegmentIndex = 0
        
        clientTab.selectedSegmentIndex = 0
        
        indexChanged()
        
    }

    func indexChanged() {
        
        switch tabSwitch.selectedSegmentIndex {
        case 0:
            print("appointments")
            calendarView.isHidden = true
            clientTab.isHidden = false
            clientListToday.view.isHidden = false
            clientListToday.view.frame = CGRect(x: containerView.bounds.origin.x, y: containerView.bounds.minY + 50, width: containerView.bounds.width, height: containerView.bounds.height)
            self.addChildViewController(clientListToday)
            self.containerView.addSubview(clientListToday.view)
            
            if(clientListToday.isViewLoaded) {
                if(clientListToday.view.isHidden) {
                    clientListToday.view.isHidden = false
                }
            }
            
        case 1:
            print("availability")
            clientTab.isHidden = true
            clientListToday.view.isHidden = true
            clientListPending.view.isHidden = true
            clientListConfirmed.view.isHidden = true
            calendarView.frame = containerView.bounds
            self.containerView.addSubview(calendarView)
            
                if(calendarView.isHidden) {
                    calendarView.isHidden = false
                }
            
            
        default:
            break
        }
        
    }
    
    func clientTabIndexChanged() {
        
        switch clientTab.selectedSegmentIndex {
        case 0:
            clientListPending.view.isHidden = true
            clientListConfirmed.view.isHidden = true
            clientListToday.view.isHidden = false
            clientListToday.view.frame = CGRect(x: containerView.bounds.origin.x, y: containerView.bounds.minY + 50, width: containerView.bounds.width, height: containerView.bounds.height)
            self.addChildViewController(clientListToday)
            self.containerView.addSubview(clientListToday.view)
            
        case 1:
            clientListConfirmed.view.isHidden = true
            clientListToday.view.isHidden = true
            clientListPending.view.isHidden = false
            clientListPending.view.frame = CGRect(x: containerView.bounds.origin.x, y: containerView.bounds.minY + 50, width: containerView.bounds.width, height: containerView.bounds.height)
            self.addChildViewController(clientListPending)
            self.containerView.addSubview(clientListPending.view)
            
        case 2:
            clientListPending.view.isHidden = true
            clientListToday.view.isHidden = true
            clientListConfirmed.view.isHidden = false
            calendarView.frame = containerView.bounds
            self.containerView.addSubview(calendarView)
            
            if(calendarView.isHidden) {
                calendarView.isHidden = false
            }
            
            
        default:
            break
        }
        
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
