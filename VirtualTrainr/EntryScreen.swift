//
//  EntryScreen.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-25.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Localize_Swift

class EntryScreen: UIViewController {
    
    var playerItem: AVPlayerItem!
    var videoPlayer: AVQueuePlayer!
    
    // view variables
    var logo: UIImageView!
    
    var startedBtn = UIButton()
    var loginBtn = UIButton()
    
    let languageBtn = UIButton()

    let sloganLbl = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()

        Localize.setCurrentLanguage("en")
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        self.view.backgroundColor = UIColor.white
        self.videoPlayer = AVQueuePlayer()

        
            let session: NSError! = nil
            let path: URL! = Bundle.main.url(forResource: "start_video", withExtension: ".mp4")
            let asset: AVAsset! = AVAsset(url: path)
            playerItem = AVPlayerItem(asset: asset)
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print(session)
            }
        
        videoPlayer.insert(playerItem, after: nil)

        let videoLayer = AVPlayerLayer(player: self.videoPlayer)
        videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        videoLayer.frame = UIScreen.main.bounds
        
        //add to  movie view
        self.view.layer.addSublayer(videoLayer)
        videoPlayer.seek(to: kCMTimeZero)
        videoPlayer.volume = 1.0
        videoPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        videoPlayer.play()
  
       var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
       let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = UIScreen.main.bounds
        blurEffectView.effect = blurEffect
        self.view.addSubview(blurEffectView)
        
        // logo
        logo = UIImageView()
        let logoImage = UIImage(named: "splash_screen_logo")
        logo.contentMode = .scaleAspectFill
        logo.image = logoImage
        
        view.addSubview(logo)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        logo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -10).isActive = true
        logo.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.15).isActive = true
        logo.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
        
        // login button
        loginBtn = UIButton(type: .roundedRect)
 //       loginBtn.frame = CGRect(x: view.center.x - (view.frame.width * 0.8)/2, y: view.frame.maxY - 20 - (view.frame.height * 0.10), width: view.frame.width * 0.9, height: view.frame.height * 0.10)
        let borderImage = UIImage(named: "splash_screen_border_button")
        loginBtn.setBackgroundImage(borderImage, for: .normal)
        loginBtn.layer.cornerRadius = 20
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "SFUIText-LightItalic", size: 17)
        loginBtn.isUserInteractionEnabled = true
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(self.logInBtnPressed), for: .touchUpInside)
        
        // started button
        startedBtn = UIButton(type: .roundedRect)
   //     startedBtn.frame = CGRect(x: view.center.x - (view.frame.width * 0.8)/2, y: loginBtn.frame.minY - 20 - (view.frame.height * 0.10), width: view.frame.width * 0.9, height: view.frame.height * 0.10)
        let fill = UIImage(named: "splash_screen_fill_button")
        startedBtn.setBackgroundImage(fill, for: .normal)
        startedBtn.layer.cornerRadius = 20
        startedBtn.titleLabel?.font = UIFont(name: "SFUIText-LightItalic", size: 17)
        startedBtn.setTitleColor(UIColor.white, for: .normal)
        startedBtn.addTarget(self, action: #selector(self.getStartedPressed), for: .touchUpInside)
        
        view.addSubview(startedBtn)
        
        sloganLbl.font = UIFont(name: "SFUIDisplay-Heavy", size: 30)
        view.addSubview(sloganLbl)
        sloganLbl.textAlignment = .center
        sloganLbl.textColor = UIColor.white
        sloganLbl.numberOfLines = 0
        sloganLbl.translatesAutoresizingMaskIntoConstraints = false
        sloganLbl.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 0).isActive = true
        sloganLbl.bottomAnchor.constraint(equalTo: startedBtn.topAnchor, constant: 10).isActive = true
        sloganLbl.centerXAnchor.constraint(equalTo: logo.centerXAnchor, constant: 0).isActive = true
        sloganLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        sloganLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        setText()
        
        startedBtn.translatesAutoresizingMaskIntoConstraints = false
        startedBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        startedBtn.topAnchor.constraint(equalTo: sloganLbl.bottomAnchor, constant: 20).isActive = true
        startedBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        startedBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginBtn.topAnchor.constraint(equalTo: startedBtn.bottomAnchor, constant: 15).isActive = true
        loginBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        loginBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        self.view.addSubview(languageBtn)
        languageBtn.translatesAutoresizingMaskIntoConstraints = false
        languageBtn.titleLabel?.textAlignment = .right
        languageBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0)
        languageBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        languageBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        languageBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        languageBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5).isActive = true
        
        languageBtn.setTitleColor(UIColor.white, for: .normal)
        languageBtn.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 17)
        languageBtn.addTarget(self, action: #selector(languageBtnPressed), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.videoDidReachEnd(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.videoPlayer.currentItem)
        
    }
    
    func languageBtnPressed() {
        let vc = AppLanguageVC()
        present(vc, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }

    
    func setText() {
        
        loginBtn.setTitle("Login".localized(), for: .normal)
        sloganLbl.text = "GET IN THE SHAPE OF YOUR LIFE".localized()
        startedBtn.setTitle("Let's Get Started".localized(), for: .normal)
        languageBtn.setTitle("Select Language".localized(), for: .normal)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        videoPlayer.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        videoPlayer.pause()
    }
    
    override func viewWillLayoutSubviews() {
        self.view.bringSubview(toFront: logo)
        self.view.bringSubview(toFront: loginBtn)
    }
    
    func logInBtnPressed() {
        self.present(LogInVC(), animated: true, completion: nil)
    }
    
    func videoDidReachEnd(_ notification: Notification) {
        videoPlayer.seek(to: kCMTimeZero)
        videoPlayer.play()
    }
    
    func getStartedPressed() {
        let start = RegStartVC()
        self.present(start, animated: true, completion: nil)
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
