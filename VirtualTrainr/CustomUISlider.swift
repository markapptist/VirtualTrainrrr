//
//  CustomUISlider.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-03.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class CustomUISlider: UISlider {

    var valueLbl = UILabel()
    
    var prevValue = CGFloat()
    
    var prefix = " "
    
    var suffix = " "
    

    func sliderValueChanged(slider: UISlider) {
        
        var currentValue = Int(slider.value)
        
        valueLbl.text = prefix + "\(currentValue)" + suffix
        
        let thumbRectFrame = slider.thumbRect(forBounds: self.bounds, trackRect: self.bounds, value: slider.value)
        
        let newBounds = CGRect(x: thumbRectFrame.origin.x, y: thumbRectFrame.origin.y - 25, width: thumbRectFrame.width*2.0, height: thumbRectFrame.height)

        valueLbl.frame = newBounds
        
        
        
    }
    
    func createSliderView(anchor: NSLayoutYAxisAnchor, scrollView: UIScrollView, min: Float, max: Float) {
        
        
        scrollView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: anchor, constant: 15).isActive = true
        self.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6).isActive = true
        self.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        self.minimumValue = min
        self.maximumValue = max
        self.addTarget(self, action: #selector(sliderValueChanged(slider:)), for: .valueChanged)
        
        self.valueLbl = UILabel(frame: CGRect(x: self.frame.minX, y: self.frame.minY - 5, width: self.frame.width*0.8, height: self.frame.height))
        self.addSubview(valueLbl)
        valueLbl.font = UIFont(name: "SFUIText-Light", size: 12)
        valueLbl.textColor = UIColor.blue
        valueLbl.text = "\(Int(min))"
        
        let minusImgView = UIImageView()
        minusImgView.image = #imageLiteral(resourceName: "minus_ic.png")
        minusImgView.contentMode = .scaleAspectFit
        scrollView.addSubview(minusImgView)
        minusImgView.translatesAutoresizingMaskIntoConstraints = false
        minusImgView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: -30).isActive = true
        minusImgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        minusImgView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        minusImgView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        let plusImgView = UIImageView()
        plusImgView.image = #imageLiteral(resourceName: "plus_ic.png")
        plusImgView.contentMode = .scaleAspectFit
        scrollView.addSubview(plusImgView)
        plusImgView.translatesAutoresizingMaskIntoConstraints = false
        plusImgView.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30).isActive = true
        plusImgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        plusImgView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        plusImgView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
        
    }

}
