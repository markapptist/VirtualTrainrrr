//
//  WalletVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class WalletVC: UIViewController {
    
    let tabSwitch = UISegmentedControl()
    
    let setPricingTab = UISegmentedControl()
    
    let transactionsTab = UISegmentedControl()
    
    let transactionsAvail = TransactionsAvailableVC()
    
    let transactionsPending = TransactionsPendingVC()
    
    let transactionsWithdrawal = TransactionsWithdrawalVC()
    
    let gettingPaid = GettingPaidVC()
    
    let containerView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabSwitch.makeRound()
        self.view.addSubview(tabSwitch)
        tabSwitch.insertSegment(withTitle: "Set Pricing", at: 0, animated: true)
        tabSwitch.insertSegment(withTitle: "Transactions", at: 1, animated: true)
        tabSwitch.insertSegment(withTitle: "Getting Paid", at: 2, animated: true)

        tabSwitch.setEnabled(true, forSegmentAt: 0)
        tabSwitch.setEnabled(true, forSegmentAt: 1)
        tabSwitch.setEnabled(true, forSegmentAt: 2)
        
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
        containerView.topAnchor.constraint(equalTo: self.tabSwitch.bottomAnchor, constant: 20).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        
        setPricingTab.makeRound()
        self.view.addSubview(setPricingTab)
        setPricingTab.insertSegment(withTitle: "Sessions", at: 0, animated: true)
        setPricingTab.insertSegment(withTitle: "Packages", at: 1, animated: true)
        setPricingTab.isHidden = true
        setPricingTab.setEnabled(true, forSegmentAt: 0)
        setPricingTab.setEnabled(true, forSegmentAt: 1)
    
        setPricingTab.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        setPricingTab.translatesAutoresizingMaskIntoConstraints = false
        setPricingTab.layer.cornerRadius = 5
        setPricingTab.tintColor = UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
        setPricingTab.topAnchor.constraint(equalTo: tabSwitch.bottomAnchor, constant: 15).isActive = true
        setPricingTab.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        setPricingTab.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        setPricingTab.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        transactionsTab.makeRound()
        self.view.addSubview(transactionsTab)
        transactionsTab.insertSegment(withTitle: "Available", at: 0, animated: true)
        transactionsTab.insertSegment(withTitle: "Pending", at: 1, animated: true)
        transactionsTab.insertSegment(withTitle: "Withdrawals", at: 2, animated: true)
        transactionsTab.isHidden = true
        transactionsTab.setEnabled(true, forSegmentAt: 0)
        transactionsTab.setEnabled(true, forSegmentAt: 1)
        transactionsTab.setEnabled(true, forSegmentAt: 2)
        
        transactionsTab.addTarget(self, action: #selector(transactionsIndexChanged), for: .valueChanged)
        transactionsTab.translatesAutoresizingMaskIntoConstraints = false
        transactionsTab.layer.cornerRadius = 7
        transactionsTab.tintColor = UIColor.init(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
        transactionsTab.topAnchor.constraint(equalTo: tabSwitch.bottomAnchor, constant: 15).isActive = true
        transactionsTab.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        transactionsTab.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        transactionsTab.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        self.tabBarController?.tabBar.isHidden = false
        
        tabSwitch.selectedSegmentIndex = 1
        
        indexChanged()

    }
    
    func indexChanged() {
        
            switch tabSwitch.selectedSegmentIndex {
            case 0:
                print("set pricing")
            transactionsTab.isHidden = true
            transactionsAvail.view.isHidden = true
            transactionsWithdrawal.view.isHidden = true
            transactionsPending.view.isHidden = true
            gettingPaid.view.isHidden = true
            setPricingTab.isHidden = false
            setPricingTab.selectedSegmentIndex = 0
                
            case 1:
                print("transactions")
            setPricingTab.isHidden = true
            gettingPaid.view.isHidden = true
            transactionsTab.isHidden = false
            transactionsTab.selectedSegmentIndex = 0
            transactionsIndexChanged()
                
            case 2:
                print("getting paid")
            transactionsTab.isHidden = true
            transactionsAvail.view.isHidden = true
            transactionsWithdrawal.view.isHidden = true
            transactionsPending.view.isHidden = true
            setPricingTab.isHidden = true
                
            gettingPaid.view.frame = containerView.bounds
            self.addChildViewController(gettingPaid)
            self.containerView.addSubview(gettingPaid.view)
                
            if(gettingPaid.isViewLoaded) {
                
                if(gettingPaid.view.isHidden) {
                    gettingPaid.view.isHidden = false
                }
                
            }
                

                
            default:
                break
            }
            
        }
    
    func transactionsIndexChanged() {
        
        switch transactionsTab.selectedSegmentIndex {
        case 0:
            transactionsAvail.view.frame = CGRect(x: containerView.bounds.origin.x, y: containerView.bounds.minY + 30, width: containerView.bounds.width, height: containerView.bounds.height)
            self.addChildViewController(transactionsAvail)
            self.containerView.addSubview(transactionsAvail.view)
            
            if(transactionsAvail.isViewLoaded){
                
                if(transactionsAvail.view.isHidden) {
                    transactionsAvail.view.isHidden = false
                }
            }
            
            transactionsPending.view.isHidden = true
            transactionsWithdrawal.view.isHidden = true 
            
        case 1:
            transactionsPending.view.frame = CGRect(x: containerView.bounds.origin.x, y: containerView.bounds.minY + 30, width: containerView.bounds.width, height: containerView.bounds.height)
            self.addChildViewController(transactionsPending)
            self.containerView.addSubview(transactionsPending.view)
            
            if(transactionsPending.isViewLoaded){
                
                if(transactionsPending.view.isHidden) {
                    transactionsPending.view.isHidden = false
                }
            }
            
            transactionsAvail.view.isHidden = true
            transactionsWithdrawal.view.isHidden = true
            
        case 2:
            transactionsWithdrawal.view.frame = CGRect(x: containerView.bounds.origin.x, y: containerView.bounds.minY + 30, width: containerView.bounds.width, height: containerView.bounds.height)
            self.addChildViewController(transactionsWithdrawal)
            self.containerView.addSubview(transactionsWithdrawal.view)
            
            if(transactionsWithdrawal.isViewLoaded) {
                
                if(transactionsWithdrawal.view.isHidden) {
                    transactionsWithdrawal.view.isHidden = false
                }
                
            }
            
            transactionsAvail.view.isHidden = true
            transactionsPending.view.isHidden = true
            
            
        default:
            break
        }

        
    }
    
    func setPricingIndexChanged() {
    
        switch setPricingTab.selectedSegmentIndex {
        case 0: break
            
            
        default:
            break
        }
        }
    
    }
    
    




