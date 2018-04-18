//
//  LocationModel.swift
//  reconshield
//
//  Created by tecocraft on 04/12/17.
//  Copyright © 2017 tecocraft. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import Reachability

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let manager: CLLocationManager
    var locationManagerClosures: [((_ userLocation: CLLocation) -> ())] = []
    var newLocation = CLLocation()
    var lastLocation = CLLocation()
   

    override init() {
        self.manager = CLLocationManager()
        super.init()
        self.manager.delegate = self
        self.manager.pausesLocationUpdatesAutomatically = false
        //self.manager.allowsBackgroundLocationUpdates = true
        self.manager.activityType = .other
    }
    
    //This is the main method for getting the users location and will pass back the usersLocation when it is available
    func getlocationForUser(userLocationClosure: @escaping ((_ userLocation: CLLocation) -> ())) {
        
        self.locationManagerClosures.append(userLocationClosure)
        print(locationManagerClosures.description)
        
        //First need to check if the apple device has location services availabel. (i.e. Some iTouch's don't have this enabled)
        if CLLocationManager.locationServicesEnabled() {
            //Then check whether the user has granted you permission to get his location
            if CLLocationManager.authorizationStatus() == .notDetermined {
                //Request permission
                //Note: you can also ask for .requestWhenInUseAuthorization
                AppUtilities.setUserDefaults(key: "LocUpdateStart", value: "false")
                manager.requestAlwaysAuthorization()
            } else if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                AppUtilities.setUserDefaults(key: "LocUpdateStart", value: "false")
                manager.requestAlwaysAuthorization()
                let alert = UIAlertController(title: "Alert", message: "\(APP_Title) required your location to using app", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Go to Setting", style: .default, handler: { (action) in
                    UIApplication.shared.openURL(URL(string:"App-Prefs:root=Privacy&path=LOCATION")!)
                })) 
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                //... Sorry for you. You can huff and puff but you are not getting any location
            } else if CLLocationManager.authorizationStatus() == .authorizedAlways {
                // This will trigger the locationManager:didUpdateLocation delegate method to get called when the next available location of the user is available
                AppUtilities.setUserDefaults(key: "LocUpdateStart", value: "true")
                manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                manager.startUpdatingLocation()
             
                
                //var LocationUpdateTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateLocationEvery3sec), userInfo: nil, repeats: true)
                //self.locationManagerClosures.append(userLocationClosure)
                
            }
        }
        
    }
    
    //MARK: CLLocationManager Delegate methods
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
   
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        //Because multiple methods might have called getlocationForUser: method there might me multiple methods that need the users location.
        //These userLocation closures will have been stored in the locationManagerClosures array so now that we have the users location we can pass the users location into all of them and then reset the array.
        let tempClosures = self.locationManagerClosures
        for closure in tempClosures {
            closure(newLocation)
        }
        self.locationManagerClosures = []
        print(newLocation)
   }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        switch UIApplication.shared.applicationState {
        case .active:
            self.newLocation = locations.last!
            let tempClosures = self.locationManagerClosures
            for closure in tempClosures {
                closure(self.newLocation)
            }
            self.locationManagerClosures = []
            print(newLocation.coordinate.latitude)
            if self.newLocation != nil{
                manager.stopUpdatingLocation()
            }
            print("lat : \(locations.last?.coordinate.latitude) and long: \(locations.last?.coordinate.longitude)")
        case .background:
            self.newLocation = locations.last!
            print("App is backgrounded\n lat : \(locations.last?.coordinate.latitude) and long: \(locations.last?.coordinate.longitude)")
            print("Background time remaining = \(UIApplication.shared.backgroundTimeRemaining) seconds")
        case .inactive:
            break
        }
        //print("lat : \(locations.last?.coordinate.latitude) and long: \(locations.last?.coordinate.longitude)")
    }
    
    
    @objc func updateLocationEvery3sec(){
        switch UIApplication.shared.applicationState {
        case .active:
            print(newLocation.coordinate.latitude)
            print(newLocation.coordinate.longitude)
            //updateLoaction(lat: newLocation.coordinate.latitude, long: newLocation.coordinate.longitude)
            print("lat : \(newLocation.coordinate.latitude) and long: \(newLocation.coordinate.longitude)")
        case .background:
            //if UIApplication.shared.backgroundTimeRemaining > 170.0 {
                
            //}else {
                 //updateLoaction(lat: newLocation.coordinate.latitude, long: newLocation.coordinate.longitude)
                print("App is backgrounded\n lat : \(newLocation.coordinate.latitude) and long: \(newLocation.coordinate.longitude)")
                print("Background time remaining = \(UIApplication.shared.backgroundTimeRemaining) seconds")
            //}
            
        case .inactive:
            break
        }
        
    }
    
    
    
        
    
}

