//
//  RunDetailViewController.swift
//  RunTogether1.2
//
//  Created by Ian Hall on 8/18/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RunDetailViewController: UIViewController {
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var altitudeLabel: UILabel!
    
    @IBOutlet weak var averagePaceLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startStopButton: UIButton!
    
    //optional holder for our run
    var run: Run?
    
    // a bunch of variables to hold onto while running
    
    //what helps with starting and stopping location services
    let locationManager = LocationManager.shared
    
    //this is what i will use to store the duration of the run which i can convert later
    var seconds = 0
    
    
    var timer: Timer?
    
    //fancy little guy that will hold the total distance
    var distance = Measurement(value: 0, unit: UnitLength.meters)
    
    var listOfLocations: [CLLocation] = []
    
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        //stops the timer
        timer?.invalidate()
        //turns off locations when we are navigated away
        locationManager.stopUpdatingLocation()
    }
    //MARK: - HELPER FUNCS
    
    func addSecond(){
        seconds = seconds + 1
        updateLabelsAndDisplay()
    }
    
    func updateLabelsAndDisplay(){
        
        let formattedTime = Converter.formatTime(seconds: seconds)
        
        let formattedPace = Converter.paceFormatter(distance: distance, seconds: seconds, outputUnit: UnitSpeed.minutesPerMile)
        
        distanceLabel.text = "\(distance)"
        
        timeLabel.text = "\(formattedTime)"
        
        averagePaceLabel.text = "\(formattedPace)"
        
        
    }
    
    func startLocationTracking(){
        //set the delegate
        locationManager.delegate = self
        //tell it what activity we are doing
        locationManager.activityType = .fitness
        //how accurate in meters the device needs to be before giving us an update
        locationManager.distanceFilter = 10
        //start the machine
        locationManager.startUpdatingLocation()
    }
    
    func startRun(){
        //clear everything out and then go
        seconds = 0
        distance = Measurement(value: 0, unit: UnitLength.meters)
        listOfLocations.removeAll()
        updateLabelsAndDisplay()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.addSecond()
        }
        startLocationTracking()
    }
    
    
    func stopRun(){
        locationManager.stopUpdatingLocation()
    }
    
    
    //MARK: - Actions
    @IBAction func startStopButtonTapped(_ sender: Any) {
        startRun()
    }
    
    
    
}
extension RunDetailViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //filter through all locations that location manager gives us
        for location in locations{
            //grab the time since this location
            let timeOfLocation = location.timestamp.timeIntervalSinceNow
            // thank you stack overflow for this beaut which will check our accuracy
            guard location.horizontalAccuracy < 20 && abs(timeOfLocation) < 10 else {
                continue
            }
            //grab the previous location we logged if its empty send it to the listof locations
            if let lastLocation = listOfLocations.last{
                //grab the change in distance using fancy swift funcs
                let changeInDistance = location.distance(from: lastLocation)
                //add the distance and our new measurement together and set it to the distance
                distance = distance + Measurement(value: changeInDistance, unit: UnitLength.meters)
            }
            listOfLocations.append(location)
        }
    }
}
