//
//  DiscoverMapVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
//import GoogleMaps
//import GooglePlaces
import FirebaseDatabase
import CoreLocation

// pass current location to here

class DiscoverMapVC: BaseVC {

    let pinImage = UIImage(named: "location_ic")
    let sliderImage = UIImage(named: "slider_thumb")
    
    let locationManager = CLLocationManager()
    var location: CLLocationCoordinate2D? = nil
    
    var map: GMSMapView?
    var myMarker: GMSMarker?
    
    // trainers
    var trainersRef = DataService.instance.trainersRef
    
    // model
    var trainerMarkers: [GMSMarker:Trainer]? = [:]
    var currentTrainerMarkers: [GMSMarker:Trainer]? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // google map
        let camera = GMSCameraPosition.camera(withTarget: self.currentLocation, zoom: 13.0)
        map = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        
        self.view.addSubview(self.map!)
        
        self.myMarker = GMSMarker()
        self.myMarker?.icon = self.pinImage
        self.myMarker?.position = self.currentLocation
        self.myMarker?.map = self.map
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        // if location authorized
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        self.getTrainers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        trainersRef.removeAllObservers()
    }
    
    // MARK: - CLLocationManager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = self.locationManager.location?.coordinate
        self.myMarker?.position = self.location!
        self.myMarker?.map = self.map!
        
        /*
         let geoCoder = GMSGeocoder()
         let location = CLLocation(latitude: (self.location?.latitude)!, longitude: (self.location?.longitude)!)
         
         geoCoder.reverseGeocodeCoordinate(self.location!) { (response, error) in
         let gmsAddress = response?.firstResult()
         
         self.myMarker = GMSMarker()
         self.myMarker?.icon = self.pinImage
         self.myMarker?.position = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
         
         self.myMarker?.map = self.map!
         }
         */
    }
    
    // remove existing markers
    func removeTrainers() {
        if let trainerMarkers = self.trainerMarkers {
            for marker in trainerMarkers.keys {
                marker.map = nil
            }
            self.trainerMarkers?.removeAll()
        }
    }
    
    // map online trainer markers
    func mapTrainers() {
        if let trainerMarkers = self.trainerMarkers {
            for marker in trainerMarkers.keys {
                marker.map = self.map
            }
        }
    }
}

extension DiscoverMapVC {
    // MARK: - Online Trainers List
    
    func getTrainers() {
        self.trainersRef.observe(.value, with: { (snapshot) in
            
            self.removeTrainers()
            
            for trainer in snapshot.children.allObjects {
                let trainerProfile = trainer as! DataSnapshot
                let trainerData = trainerProfile.value as? NSDictionary
                
                let trainerUID = trainerProfile.key
                //                let trainerName = trainerData?["name"] as? String
                let trainerEmail = trainerData?["email"] as? String
                
                let aTrainer = Trainer(uid: trainerUID, email: trainerEmail!, name: nil)
                
                let latitude = trainerData?["latitude"] as? Double
                let longitude = trainerData?["longitude"] as? Double
                
                let latitudeDegrees = CLLocationDegrees(latitude!)
                let longitudeDegrees = CLLocationDegrees(longitude!)
                
                let coordinates = CLLocationCoordinate2D(latitude: latitudeDegrees, longitude: longitudeDegrees)
                let marker = GMSMarker()
                marker.icon = self.sliderImage
                marker.position = coordinates
                marker.snippet = trainerEmail
                
                print(marker)
                self.trainerMarkers?.updateValue(aTrainer, forKey: marker)
                
                self.locationManager.startUpdatingLocation()
            }
            self.mapTrainers()
        }) { (error) in
            self.showAlertControllerWith(title: "Error getting online trainers", message: error.localizedDescription)
        }
    }
 
}
