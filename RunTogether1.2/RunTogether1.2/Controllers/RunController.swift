//
//  RunController.swift
//  RunTogether1.2
//
//  Created by Ian Hall on 8/18/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation
import CoreData


class RunController {
    //MARK: - Properties
    
    static let shared = RunController()
    
    var fetchedRuns: NSFetchedResultsController<Run>
    
    init(){
        //create fetch Request
        let fetchRequest: NSFetchRequest<Run> = Run.fetchRequest()
        
        // i want this sorted by date so this should make it easy for me
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        let resultsController: NSFetchedResultsController<Run> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        // set my fetched runs to be the results controller
        fetchedRuns = resultsController
        do{
            // get the data
            try fetchedRuns.performFetch()
        } catch {
            
            // if there is an error print up the data
            print("error in loading up coredata performing fetch")
            print(error)
        }
        
        //MARK: - Create
        
        func logARun(averagePace: Double, altitudeGained: Double, calories: Int, distance: Double, totalTime: Double ){
            let _ = Run(altitudeGained: altitudeGained, averagePace: averagePace, calories: calories, distance: distance, totalTime: totalTime )
            saveToPersistentStore()
        }
        
        
        //i dont believe that updating a run will be 100% needed so i will leave it out
        
        
        //MARK: - REMOVE
        func deleteA(run: Run){
            run.managedObjectContext?.delete(run)
            saveToPersistentStore()
            
        }
        
        //MARK: - Save
        func saveToPersistentStore(){
            do{
                try CoreDataStack.context.save()
            } catch {
                print("error in saving the run \n ")
                print(error)
            }
        }
        
        
    }
}
