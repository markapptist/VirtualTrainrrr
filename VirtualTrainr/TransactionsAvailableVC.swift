//
//  Transactions-AvailableVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-11.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TransactionsAvailableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let makeWithdrawalBtn = SelectedItemButton()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(makeWithdrawalBtn)
        makeWithdrawalBtn.titleLbl.text = "Make a Withdrawal"
        makeWithdrawalBtn.titleLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        makeWithdrawalBtn.translatesAutoresizingMaskIntoConstraints = false
        makeWithdrawalBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        makeWithdrawalBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        makeWithdrawalBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let availableBalanceView = UIView()
        self.view.addSubview(availableBalanceView)
        availableBalanceView.translatesAutoresizingMaskIntoConstraints = false
        availableBalanceView.leadingAnchor.constraint(equalTo: makeWithdrawalBtn.leadingAnchor, constant: 10).isActive = true
        availableBalanceView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        availableBalanceView.trailingAnchor.constraint(equalTo: makeWithdrawalBtn.trailingAnchor, constant: -10).isActive = true
        availableBalanceView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        let availableBalanceLbl = UILabel()
        availableBalanceLbl.font = UIFont(name: "SFUIText-Medium", size: 20)
        availableBalanceLbl.textColor = UIColor.black
        availableBalanceLbl.textAlignment = .left
        availableBalanceLbl.text = "Available Balance"
        availableBalanceView.addSubview(availableBalanceLbl)
        availableBalanceLbl.translatesAutoresizingMaskIntoConstraints = false
        availableBalanceLbl.leadingAnchor.constraint(equalTo: availableBalanceView.leadingAnchor).isActive = true
        availableBalanceLbl.topAnchor.constraint(equalTo: availableBalanceView.topAnchor).isActive = true
        availableBalanceLbl.widthAnchor.constraint(equalTo: availableBalanceView.widthAnchor, multiplier: 0.6).isActive = true
        availableBalanceLbl.bottomAnchor.constraint(equalTo: availableBalanceView.bottomAnchor).isActive = true
        
        let availableBalanceLbl2 = UILabel()
        availableBalanceLbl2.font = UIFont(name: "SFUIText-Medium", size: 20)
        availableBalanceLbl2.textColor = UIColor.black
        availableBalanceLbl2.textAlignment = .right
        availableBalanceLbl2.text = "$100"
        availableBalanceView.addSubview(availableBalanceLbl2)
        availableBalanceLbl2.translatesAutoresizingMaskIntoConstraints = false
        availableBalanceLbl2.trailingAnchor.constraint(equalTo: availableBalanceView.trailingAnchor).isActive = true
        availableBalanceLbl2.topAnchor.constraint(equalTo: availableBalanceView.topAnchor).isActive = true
        availableBalanceLbl2.widthAnchor.constraint(equalTo: availableBalanceView.widthAnchor, multiplier: 0.4).isActive = true
        availableBalanceLbl2.bottomAnchor.constraint(equalTo: availableBalanceView.bottomAnchor).isActive = true
        
        makeWithdrawalBtn.topAnchor.constraint(equalTo: availableBalanceView.bottomAnchor).isActive = true
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: makeWithdrawalBtn.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: makeWithdrawalBtn.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: makeWithdrawalBtn.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TransactionsTableViewCell.self, forCellReuseIdentifier: "TransactionsTableViewCell")


    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsTableViewCell", for: indexPath) as! TransactionsTableViewCell
        
        if indexPath.row == 0 {
            cell.setBold = true
            cell.leftLbl.text = "Amount"
            cell.midLbl.text = "Date"
            cell.rightLbl.text = "Received From"
        } else {
            cell.setBold = false
            cell.leftLbl.text = "$100"
            cell.midLbl.text = "Sept 25, 2016"
            cell.rightLbl.text = "John Smith"
        }
        
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
