//
//  TrainerMeetUpLocationVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-19.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerMeetUpLocationVC: TrainerMeetUpVC {
    
    let map = DiscoverMapVC()
    
    let containerView = UIView()
    
    let nextBtn = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bottomLabel.removeFromSuperview()
        bottomButton.removeFromSuperview()
        topLabel.removeFromSuperview()
        topButton.removeFromSuperview()
        
        self.pageControl.isHidden = true
        self.titleLbl.text = "Where would you like to meet your trainer?"
                
        self.view.addSubview(containerView)
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        map.view.frame = containerView.bounds
        self.addChildViewController(map)
        containerView.addSubview(map.view)

        nextBtn.setImage(#imageLiteral(resourceName: "right_arrow_green_bt"), for: .normal)
        self.view.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor, constant: -20).isActive = true
        nextBtn.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor, constant: -20).isActive = true
        nextBtn.addTarget(self, action: #selector(self.nextBtnPressed), for: .touchUpInside)
        
    }
    
    func nextBtnPressed() {
        
        present(TrainerMeetUpDateVC(), animated: true, completion: nil)
      
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
