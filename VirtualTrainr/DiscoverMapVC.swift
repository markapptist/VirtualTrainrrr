//
//  DiscoverMapVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class DiscoverMapVC: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var location: CLLocationCoordinate2D? = nil
    
    var map: GMSMapView?
    var marker: GMSMarker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        self.tabBarController?.tabBar.isHidden = true

    }
    
    // MARK: - CLLocationManager Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = self.locationManager.location?.coordinate
        self.locationManager.stopUpdatingLocation()
        
        let geoCoder = GMSGeocoder()
        let location = CLLocation(latitude: (self.location?.latitude)!, longitude: (self.location?.longitude)!)
        
        geoCoder.reverseGeocodeCoordinate(self.location!) { (response, error) in
            
            let gmsAddress = response?.firstResult()
            
            /*
             if let locationName = gmsAddress?.thoroughfare {
             
             }
             if let postalCode = gmsAddress?.postalCode {
             
             }
             */
            
            self.marker = GMSMarker()
            self.marker?.position = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            
            let camera = GMSCameraPosition.camera(withTarget: self.location!, zoom: 17.5)
            let gMapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
            
            self.marker?.map = gMapView
            self.map = gMapView
            
            self.view.addSubview(self.map!)
        }
        
    }
    
}

/*
 extension DiscoverMapVC: GMSAutocompleteViewControllerDelegate {
 
 // Handle the user's selection.
 func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
 
 dismiss(animated: true) {
 
 let coordinates = CLLocationCoordinate2DMake(place.coordinate.latitude, place.coordinate.longitude)
 let cameraUpdate = GMSCameraUpdate.setTarget(coordinates, zoom: 17.5)
 
 self.map?.animate(with: cameraUpdate)
 
 self.marker?.position = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
 
 let geocoder = GMSGeocoder()
 
 geocoder.reverseGeocodeCoordinate(place.coordinate, completionHandler: { (response, error) in
 if error == nil {
 let gmsAddress = response?.firstResult()
 self.marker?.title = gmsAddress?.thoroughfare
 self.marker?.snippet = gmsAddress?.postalCode
 
 }
 else {
 // error
 }
 })
 }
 }
 
 func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
 // TODO: handle the error.
 print("Error: ", error.localizedDescription)
 }
 
 // User canceled the operation.
 func wasCancelled(_ viewController: GMSAutocompleteViewController) {
 dismiss(animated: true, completion: nil)
 }
 
 // Turn the network activity indicator on and off again.
 func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
 UIApplication.shared.isNetworkActivityIndicatorVisible = true
 }
 
 func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
 UIApplication.shared.isNetworkActivityIndicatorVisible = false
 }
 
 }
 */
