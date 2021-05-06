//
//  Task+Convenience.swift
//  TaskCoreData
//
//  Created by Justin Webster on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String?, isComplete: Bool = false, dueDate: Date? = Date(), context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.uuid = UUID()
    }
}
