//
//  PersistentManager.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import CoreData

final class PersistentManager {
    // MARK: - SINGLETON -
    static let shared = PersistentManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RMAnimation")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    private init() {}
}

// MARK: - CODE DATA SAVING SUPPORT -
extension PersistentManager {
    func saveContext () {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

// MARK: - AUX METHODS -
extension PersistentManager {
    func fetchDataBase<T: NSManagedObject>(_ dataBase: T.Type) -> T? {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest<T>(entityName: String(describing: T.self))
        do {
            let result = try PersistentManager.shared.context.fetch(fetchRequest)
            return result.first
        } catch {
            return nil
        }
    }
}

