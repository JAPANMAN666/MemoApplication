//
//  CoreDataController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/02/02.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import Foundation
import CoreData

class CoreDataController: NSObject {
    var persistentContainer: NSPersistentContainer
    
    /// Persistent Containerを初期化
    init(completionClosure: @escaping () -> ()) {
        persistentContainer = NSPersistentContainer(name: "MemoApplication")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            completionClosure()
        })
    }
    
    public func createItems() -> MemoItem {
        let context = persistentContainer.viewContext
        let item = NSEntityDescription.insertNewObject(forEntityName: "MemoItems", into: context) as! MemoItem
        
        return item
    }
    
    public func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    public func deleteItem(_ item: MemoItem) {
        let context = persistentContainer.viewContext
        
        context.delete(item)
    }
    
    public func fetchItem() -> [MemoItem] {
        let context = persistentContainer.viewContext
        let itemFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "MemoItem")
        
        do {
            let fetchItems = try context.fetch(itemFetch) as! [MemoItem]
            return fetchItems
        } catch {
            fatalError("Failed to fetch items: \(error)")
        }
    }
}
