//
//  PaymentSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-19.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class PaymentSegmentVC: UIViewController {
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height)
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true

        
        let paymentView1 = makeRoundedView(anchor: self.scrollView.topAnchor, constant: 0)
        let paymentView2 = makeRoundedView(anchor: paymentView1.bottomAnchor, constant: 10)
        let paymentView3 = makeRoundedView(anchor: paymentView2.bottomAnchor, constant: 10)
        let newCardButton = makeRoundedButton(anchor: paymentView3.bottomAnchor, constant: 10, leftTxt: "Add new card", middleTxt: " ", rightTxt: "+")
        let paypalButton = makeRoundedButton(anchor: newCardButton.bottomAnchor, constant: 20, leftTxt: "", middleTxt: "Paypal", rightTxt: "")
        
    }
    
    func makeRoundedView(anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        
        let roundedView = UIView()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.black.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        roundedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        roundedView.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        roundedView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let amount = UILabel()
        amount.text = "VISA"
        amount.textAlignment = .left
        amount.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(amount)
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 20).isActive = true
        amount.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        amount.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.2).isActive = true
        amount.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        let date = UILabel()
        date.text = "Personal"
        date.textAlignment = .left
        date.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 100).isActive = true
        date.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        date.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.4).isActive = true
        date.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        
        let name = UILabel()
        name.text = "444444444433333333"
        name.textAlignment = .left
        name.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 220).isActive = true
        name.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        name.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.4).isActive = true
        name.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        return roundedView
    }
    
    func makeRoundedButton(anchor: NSLayoutYAxisAnchor, constant: CGFloat, leftTxt: String, middleTxt: String, rightTxt: String) -> UIButton {
        
        let roundedView = UIButton()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.black.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        roundedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        roundedView.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        roundedView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let amount = UILabel()
        amount.text = leftTxt
        amount.textAlignment = .left
        amount.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(amount)
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 20).isActive = true
        amount.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        amount.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.2).isActive = true
        amount.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        let date = UILabel()
        date.text = middleTxt
        date.textAlignment = .left
        date.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 100).isActive = true
        date.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        date.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.4).isActive = true
        date.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        
        let name = UILabel()
        name.text = rightTxt
        name.textAlignment = .left
        name.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 220).isActive = true
        name.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        name.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.4).isActive = true
        name.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        return roundedView
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
