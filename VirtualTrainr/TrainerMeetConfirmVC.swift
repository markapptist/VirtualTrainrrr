//
//  TrainerMeetConfirmVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-19.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerMeetConfirmVC: TrainerMeetUpVC {
    
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = "Confirm and pay for your appointment"
        
        topButton.removeFromSuperview()
        topLabel.removeFromSuperview()
        bottomButton.removeFromSuperview()
        bottomLabel.removeFromSuperview()
        
        let trainerView = UIView()
        self.view.addSubview(trainerView)
        trainerView.layer.backgroundColor = UIColor.white.cgColor
        trainerView.layer.opacity = 0.2
        trainerView.translatesAutoresizingMaskIntoConstraints = false
        trainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        trainerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        trainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        trainerView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
        
        let trainerLbl = UILabel()
        trainerLbl.text = "Trainer"
        trainerLbl.textAlignment = .center
        trainerLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        trainerLbl.textColor = UIColor.white
        self.view.addSubview(trainerLbl)
        trainerLbl.translatesAutoresizingMaskIntoConstraints = false
        trainerLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        trainerLbl.heightAnchor.constraint(equalTo: trainerView.heightAnchor, multiplier: 1.0).isActive = true
        trainerLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        trainerLbl.centerYAnchor.constraint(equalTo: trainerView.centerYAnchor).isActive = true
        
        let locationLbl = UILabel()
        locationLbl.text = "Location"
        locationLbl.textAlignment = .center
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        locationLbl.textColor = UIColor.white
        self.view.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: trainerView.heightAnchor, multiplier: 1.0).isActive = true
        locationLbl.leadingAnchor.constraint(equalTo: trainerLbl.trailingAnchor, constant: 30).isActive = true
        locationLbl.centerYAnchor.constraint(equalTo: trainerView.centerYAnchor).isActive = true
       
        
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.makeRound()
        imageView.image = #imageLiteral(resourceName: "sample_image.png")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        imageView.topAnchor.constraint(equalTo: trainerView.bottomAnchor, constant: 10).isActive = true
        
        
        let nameLbl = UILabel()
        self.view.addSubview(nameLbl)
        nameLbl.text = "John Smith"
        nameLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        nameLbl.textAlignment = .left
        nameLbl.textColor = UIColor.white
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.02).isActive = true
        nameLbl.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15).isActive = true
        nameLbl.topAnchor.constraint(equalTo: trainerView.bottomAnchor, constant: 20).isActive = true
        
        star1.image = #imageLiteral(resourceName: "full_star")
        star1.contentMode = .scaleAspectFit
        self.view.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0).isActive = true
        star1.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star1.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star1.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star2.image = #imageLiteral(resourceName: "full_star")
        star2.contentMode = .scaleAspectFit
        self.view.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leadingAnchor.constraint(equalTo: self.star1.trailingAnchor, constant: 1).isActive = true
        star2.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star2.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star2.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star3.image = #imageLiteral(resourceName: "full_star")
        star3.contentMode = .scaleAspectFit
        self.view.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.leadingAnchor.constraint(equalTo: self.star2.trailingAnchor, constant: 1).isActive = true
        star3.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star3.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star3.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star4.image = #imageLiteral(resourceName: "empty_star")
        star4.contentMode = .scaleAspectFit
        self.view.addSubview(star4)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.leadingAnchor.constraint(equalTo: self.star3.trailingAnchor, constant: 1).isActive = true
        star4.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star4.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star4.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star5.image = #imageLiteral(resourceName: "empty_star")
        star5.contentMode = .scaleAspectFit
        self.view.addSubview(star5)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.leadingAnchor.constraint(equalTo: self.star4.trailingAnchor, constant: 1).isActive = true
        star5.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star5.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star5.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        let addressLbl = UILabel()
        self.view.addSubview(addressLbl)
        addressLbl.textColor = UIColor.white
        addressLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        addressLbl.text = "285 Cordial Dr,"
        addressLbl.adjustsFontSizeToFitWidth = true
        addressLbl.textAlignment = .center
        addressLbl.numberOfLines = 2
        addressLbl.translatesAutoresizingMaskIntoConstraints = false
        addressLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        addressLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        addressLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        addressLbl.topAnchor.constraint(equalTo: nameLbl.topAnchor, constant: 0).isActive = true
        
        let addressLbl2 = UILabel()
        self.view.addSubview(addressLbl2)
        addressLbl2.textColor = UIColor.white
        addressLbl2.font = UIFont(name: "SFUIText-Light", size: 14)
        addressLbl2.text = "Bridgeville, PA, 15017"
        addressLbl2.adjustsFontSizeToFitWidth = true
        addressLbl2.textAlignment = .center
        addressLbl2.numberOfLines = 2
        addressLbl2.translatesAutoresizingMaskIntoConstraints = false
        addressLbl2.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        addressLbl2.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        addressLbl2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        addressLbl2.topAnchor.constraint(equalTo: addressLbl.bottomAnchor, constant: 0).isActive = true
        
        
        let dateTimeView = UIView()
        self.view.addSubview(dateTimeView)
        dateTimeView.layer.backgroundColor = UIColor.white.cgColor
        dateTimeView.layer.opacity = 0.2
        dateTimeView.translatesAutoresizingMaskIntoConstraints = false
        dateTimeView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        dateTimeView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        dateTimeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dateTimeView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        
        let dateLbl = UILabel()
        dateLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        dateLbl.textAlignment = .center
        dateLbl.text = "Date"
        dateLbl.textColor = UIColor.white
        self.view.addSubview(dateLbl)
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.centerXAnchor.constraint(equalTo: trainerLbl.centerXAnchor, constant: 0).isActive = true
        dateLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        dateLbl.topAnchor.constraint(equalTo: dateTimeView.topAnchor, constant: 0).isActive = true
        dateLbl.heightAnchor.constraint(equalTo: dateTimeView.heightAnchor, constant: 0).isActive = true
        
        let dateDetailLbl = UILabel()
        self.view.addSubview(dateDetailLbl)
        dateDetailLbl.translatesAutoresizingMaskIntoConstraints = false
        dateDetailLbl.text = "Sept. 6, 2016"
        dateDetailLbl.textAlignment = .center
        dateDetailLbl.textColor = UIColor.white
        dateDetailLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        dateDetailLbl.topAnchor.constraint(equalTo: dateTimeView.bottomAnchor, constant: 0).isActive = true
        dateDetailLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        dateDetailLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        dateDetailLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        let timeDetailLbl = UILabel()
        self.view.addSubview(timeDetailLbl)
        timeDetailLbl.translatesAutoresizingMaskIntoConstraints = false
        timeDetailLbl.text = "8:00 am"
        timeDetailLbl.textColor = UIColor.white
        timeDetailLbl.textAlignment = .center
        timeDetailLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        timeDetailLbl.topAnchor.constraint(equalTo: dateTimeView.bottomAnchor, constant: 0).isActive = true
        timeDetailLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        timeDetailLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        timeDetailLbl.leadingAnchor.constraint(equalTo: dateDetailLbl.trailingAnchor, constant: 0).isActive = true
        
        let timeLbl = UILabel()
        timeLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        timeLbl.textAlignment = .center
        timeLbl.text = "Time"
        timeLbl.textColor = UIColor.white
        self.view.addSubview(timeLbl)
        timeLbl.translatesAutoresizingMaskIntoConstraints = false
        timeLbl.centerXAnchor.constraint(equalTo: locationLbl.centerXAnchor, constant: 0).isActive = true
        timeLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        timeLbl.topAnchor.constraint(equalTo: dateTimeView.topAnchor, constant: 0).isActive = true
        timeLbl.heightAnchor.constraint(equalTo: dateTimeView.heightAnchor, constant: 0).isActive = true
        
        let planView = UIView()
        self.view.addSubview(planView)
        planView.layer.backgroundColor = UIColor.white.cgColor
        planView.layer.opacity = 0.2
        planView.translatesAutoresizingMaskIntoConstraints = false
        planView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        planView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        planView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        planView.topAnchor.constraint(equalTo: dateDetailLbl.bottomAnchor, constant: 0).isActive = true
        
        let planLbl = UILabel()
        planLbl.text = "Plan"
        planLbl.textAlignment = .center
        planLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        planLbl.textColor = UIColor.white
        self.view.addSubview(planLbl)
        planLbl.translatesAutoresizingMaskIntoConstraints = false
        planLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        planLbl.heightAnchor.constraint(equalTo: planView.heightAnchor, multiplier: 1.0).isActive = true
        planLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        planLbl.centerYAnchor.constraint(equalTo: planView.centerYAnchor).isActive = true
        
        let priceLbl = UILabel()
        priceLbl.text = "Price"
        priceLbl.textAlignment = .center
        priceLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        priceLbl.textColor = UIColor.white
        self.view.addSubview(priceLbl)
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        priceLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        priceLbl.heightAnchor.constraint(equalTo: planView.heightAnchor, constant: 0).isActive = true
        priceLbl.topAnchor.constraint(equalTo: planView.topAnchor, constant: 0).isActive = true
        priceLbl.centerXAnchor.constraint(equalTo: timeLbl.centerXAnchor).isActive = true

        let planDetailLbl = UILabel()
        self.view.addSubview(planDetailLbl)
        planDetailLbl.translatesAutoresizingMaskIntoConstraints = false
        planDetailLbl.text = "1 Training Session"
        planDetailLbl.textAlignment = .center
        planDetailLbl.textColor = UIColor.white
        planDetailLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        planDetailLbl.topAnchor.constraint(equalTo: planView.bottomAnchor, constant: 0).isActive = true
        planDetailLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        planDetailLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        planDetailLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        let priceDetailLbl = UILabel()
        self.view.addSubview(priceDetailLbl)
        priceDetailLbl.translatesAutoresizingMaskIntoConstraints = false
        priceDetailLbl.text = "$65.00"
        priceDetailLbl.textColor = UIColor.white
        priceDetailLbl.textAlignment = .center
        priceDetailLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        priceDetailLbl.topAnchor.constraint(equalTo: planView.bottomAnchor, constant: 0).isActive = true
        priceDetailLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        priceDetailLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        priceDetailLbl.leadingAnchor.constraint(equalTo: planDetailLbl.trailingAnchor, constant: 0).isActive = true

        self.view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.topAnchor.constraint(equalTo: priceDetailLbl.bottomAnchor, constant: 10).isActive = true
        bottomButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        bottomButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        bottomButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        self.view.addSubview(bottomLabel)
        bottomLabel.font = standardFont
        bottomLabel.textAlignment = .center
        bottomLabel.text = "Confirm & Pay"
        bottomLabel.textColor = UIColor.white
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.centerXAnchor.constraint(equalTo: bottomButton.centerXAnchor).isActive = true
        bottomLabel.centerYAnchor.constraint(equalTo: bottomButton.centerYAnchor).isActive = true
        bottomLabel.widthAnchor.constraint(equalTo: bottomButton.widthAnchor).isActive = true
        bottomLabel.heightAnchor.constraint(equalTo: bottomButton.heightAnchor).isActive = true
        
    }
    
    override func bottomBtnPressed() {
        present(TrainerMeetDoneVC(), animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
    }

}
