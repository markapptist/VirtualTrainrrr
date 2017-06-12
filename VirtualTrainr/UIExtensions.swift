//
//  UIExtensions.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
}

extension UILabel {
    func setSpacing(space: CGFloat) {
        
        let attributedString = NSMutableAttributedString(string: (self.text!))
        attributedString.addAttribute(NSKernAttributeName, value: space, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
        
    }
}

extension UIView {
    
    func makeRound() {
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
}

extension UIImageView {
    
    func addBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
}
extension UIViewController {
    
    // activity indicators
    func showActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    // alert controller
    func showAlertControllerWith(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // display child view controller
    func displayContentController(content: UIViewController) {
        self.addChildViewController(content)
        content.view.frame = self.view.frame
        self.view.addSubview(content.view)
        content.didMove(toParentViewController: self)
    }
    
    // hide child view controller
    func hideContentController(content: UIViewController) {
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    func makeDividers(title: String, anchor: NSLayoutYAxisAnchor, dividersHidden: Bool, scrollView: UIScrollView) -> NSLayoutYAxisAnchor {
        
        let centerLbl = UILabel()
        centerLbl.text = title
        centerLbl.textColor = UIColor.black
        centerLbl.textAlignment = .center
        centerLbl.adjustsFontSizeToFitWidth = true
        centerLbl.font = UIFont(name: "SFUIText-Medium", size: 20)
        scrollView.addSubview(centerLbl)
        centerLbl.translatesAutoresizingMaskIntoConstraints = false
        centerLbl.topAnchor.constraint(equalTo: anchor, constant: 20).isActive = true
        centerLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        centerLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04).isActive = true
        centerLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        
        let leftLine = UIView()
        scrollView.addSubview(leftLine)
        leftLine.backgroundColor = UIColor.lightGray
        leftLine.alpha = 0.5
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.003).isActive = true
        leftLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        leftLine.trailingAnchor.constraint(equalTo: centerLbl.leadingAnchor, constant: -5).isActive = true
        leftLine.centerYAnchor.constraint(equalTo: centerLbl.centerYAnchor).isActive = true
        
        let rightLine = UIView()
        scrollView.addSubview(rightLine)
        rightLine.backgroundColor = UIColor.lightGray
        rightLine.alpha = 0.5
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.003).isActive = true
        rightLine.leadingAnchor.constraint(equalTo: centerLbl.trailingAnchor, constant: 15).isActive = true
        rightLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        rightLine.centerYAnchor.constraint(equalTo: centerLbl.centerYAnchor).isActive = true
        
        if dividersHidden == true {
            leftLine.isHidden = true
            rightLine.isHidden = true
        }
        
        return centerLbl.bottomAnchor
        
    }
    
    func addSelectionBtnRow(anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> NSLayoutYAxisAnchor {
        
        let leftItem = SelectionButton()
        leftItem.textLbl.text = "10 AM"
        self.view.addSubview(leftItem)
        leftItem.translatesAutoresizingMaskIntoConstraints = false
        leftItem.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        leftItem.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        leftItem.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        leftItem.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        let rightItem = SelectionButton()
        rightItem.textLbl.text = "10 AM"
        self.view.addSubview(rightItem)
        rightItem.translatesAutoresizingMaskIntoConstraints = false
        rightItem.leadingAnchor.constraint(equalTo: leftItem.trailingAnchor).isActive = true
        rightItem.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        rightItem.widthAnchor.constraint(equalTo: leftItem.widthAnchor, multiplier: 1.0).isActive = true
        rightItem.heightAnchor.constraint(equalTo: leftItem.heightAnchor, multiplier: 1.0).isActive = true
        
        return leftItem.bottomAnchor
    }
    
    func makeTwoButtonRow(anchor: NSLayoutYAxisAnchor, constant: CGFloat, scrollView: UIView, itemOneString: String, itemTwoString: String) -> NSLayoutYAxisAnchor {
        
        let itemBtn1 = SelectedItemButton()
        scrollView.addSubview(itemBtn1)
        itemBtn1.translatesAutoresizingMaskIntoConstraints = false
        itemBtn1.titleLbl.text = itemOneString
        itemBtn1.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        itemBtn1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.43).isActive = true
        itemBtn1.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        
        let itemBtn2 = SelectedItemButton()
        scrollView.addSubview(itemBtn2)
        itemBtn2.translatesAutoresizingMaskIntoConstraints = false
        itemBtn2.titleLbl.text = itemTwoString
        itemBtn2.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn2.leadingAnchor.constraint(equalTo: itemBtn1.trailingAnchor, constant: 20).isActive = true
        itemBtn2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.43).isActive = true
        itemBtn2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        
        return itemBtn1.bottomAnchor
        
    }
    
    func makeOneButtonRow(anchor: NSLayoutYAxisAnchor, constant: CGFloat, scrollView: UIView, itemOneString: String) -> NSLayoutYAxisAnchor {
        
        let itemBtn1 = SelectedItemButton()
        scrollView.addSubview(itemBtn1)
        itemBtn1.translatesAutoresizingMaskIntoConstraints = false
        itemBtn1.titleLbl.text = itemOneString
        itemBtn1.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        itemBtn1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.43).isActive = true
        itemBtn1.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        
        
        return itemBtn1.bottomAnchor
        
    }
    
    
}
