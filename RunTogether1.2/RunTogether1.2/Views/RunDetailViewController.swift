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
    //MARK: - HELPER FUNCS
    
    func addSecond(){
        seconds = seconds + 1
        updateLabelsAndDisplay()
    }
    
    func updateLabelsAndDisplay(){
        
        distanceLabel.text = MeasurementFormatter().string(from: distance)
        
        let mins = seconds % 60
        
        //TODO: - add functionality to change the label from total secs to a more useable format
        timeLabel.text = String(seconds)
        
        
    }
    
    //MARK: - Actions
    @IBAction func startStopButtonTapped(_ sender: Any) {
    }
    
    
    
}
