//
//  RunDetailViewController.swift
//  RunTogether1.2
//
//  Created by Ian Hall on 8/18/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit
import MapKit

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
    
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
    }
    
    func setView(){
        
    }
    
    //MARK: - Actions
    @IBAction func startStopButtonTapped(_ sender: Any) {
    }
    
    
    
}
