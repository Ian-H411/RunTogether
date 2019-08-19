//
//  Race.swift
//  RunTogether1.2
//
//  Created by Ian Hall on 8/18/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation
import CoreData


extension Run {
    
    // im hoping to temporarily store these values until the race is over and then upon hitting the save button this will kick in
    
    convenience init(altitudeGained: Double, averagePace: Double, calories: Int, date: Date = Date(), distance : Double, totalTime: Double, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        
        // altitude gained during the run i dont know how im going to deal with it yet but i should save it to save myself the future headache
        self.altitudeGained = altitudeGained
        
        //average pace held by the race during the race
        self.averagePace = averagePace
        
        // calories burnt throughout the run
        self.calories = Int64(calories)
        
        // specific timestamp for when the user hit the start button
        self.date = date
        
        // amount of distance run by the racer
        self.distance = distance
        
        // time from begining to end
        self.totalTime = totalTime
        
    }
}
