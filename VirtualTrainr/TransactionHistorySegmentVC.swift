//
//  TransactionHistorySegmentVC.swift
//  
//
//  Created by Mark Meritt on 2017-04-18.
//
//

import UIKit

class TransactionHistorySegmentVC: UIViewController {
    
    let titleView = UIView()
    
    let amountLbl = UILabel()
    
    let dateLbl = UILabel()
    
    let paidTo = UILabel()
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = UIColor.white
        
        titleView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        titleView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        titleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        titleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height)
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true

        
        self.view.addSubview(amountLbl)
        amountLbl.text = "Amount"
        amountLbl.font = UIFont(name: "SFUIText-Light", size: 12)
        amountLbl.translatesAutoresizingMaskIntoConstraints = false
        amountLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        amountLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        amountLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        amountLbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        
        self.view.addSubview(dateLbl)
        dateLbl.text = "Date"
        dateLbl.font = UIFont(name: "SFUIText-Light", size: 12)
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        dateLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        dateLbl.leadingAnchor.constraint(equalTo: self.amountLbl.trailingAnchor, constant: 10).isActive = true
        dateLbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        
        self.view.addSubview(paidTo)
        paidTo.text = "Paid To"
        paidTo.font = UIFont(name: "SFUIText-Light", size: 12)
        paidTo.translatesAutoresizingMaskIntoConstraints = false
        paidTo.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        paidTo.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        paidTo.leadingAnchor.constraint(equalTo: self.dateLbl.trailingAnchor, constant: 20).isActive = true
        paidTo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        
        let historyView1 = makeRoundedView(anchor: titleView.bottomAnchor, constant: 0)
        let historyView2 = makeRoundedView(anchor: historyView1.bottomAnchor, constant: 10)

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
        amount.text = "$100"
        amount.textAlignment = .left
        amount.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(amount)
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.leadingAnchor.constraint(equalTo: amountLbl.leadingAnchor, constant: 0).isActive = true
        amount.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        amount.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.2).isActive = true
        amount.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        let date = UILabel()
        date.text = "Sept.25 2016"
        date.textAlignment = .left
        date.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.leadingAnchor.constraint(equalTo: dateLbl.leadingAnchor, constant: -10).isActive = true
        date.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        date.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.4).isActive = true
        date.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        
        let name = UILabel()
        name.text = "Johnathan Smith"
        name.textAlignment = .left
        name.font = UIFont(name: "SFUIText-Light", size: 10)
        roundedView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: paidTo.leadingAnchor, constant: -20).isActive = true
        name.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        name.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.4).isActive = true
        name.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        let pic = UIImageView()
        pic.translatesAutoresizingMaskIntoConstraints = false
        roundedView.addSubview(pic)
        pic.image = #imageLiteral(resourceName: "sample_image.png")
        pic.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -5).isActive = true
        pic.centerYAnchor.constraint(equalTo: name.centerYAnchor).isActive = true
        pic.widthAnchor.constraint(equalToConstant: 20).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return roundedView
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
