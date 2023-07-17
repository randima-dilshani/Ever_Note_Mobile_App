//
//  DBManager.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.
//

import UIKit
import CoreData

class DBManager
{
    static let share = DBManager()
    
    //save
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Note_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchStudentNotes() -> [StudentNotes]
    {
        var studentnotes = [StudentNotes]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: StudentNotes.description())
       fetchRequest.predicate = NSPredicate(format: "notestatus == %@", argumentArray: [false])
        
        do{
            studentnotes = try context.fetch(fetchRequest) as! [StudentNotes]
            }
        catch{
            print("fetching error")
        }
        return studentnotes
        }
    
    func fetchCompletedStudentNotes() -> [StudentNotes]
    {
        var notes = [StudentNotes]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: StudentNotes.description())
        fetchRequest.predicate = NSPredicate(format: "notestatus == %@", argumentArray: [true])
        
        do{
            notes = try context.fetch(fetchRequest) as! [StudentNotes]
            }
        catch{
            print("fetching error")
        }
        return notes
        }
    
    
    }


