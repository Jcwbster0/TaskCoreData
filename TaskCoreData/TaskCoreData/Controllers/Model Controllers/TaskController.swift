//
//  TaskController.swift
//  TaskCoreData
//
//  Created by Justin Webster on 4/27/21.
//

import CoreData

class TaskController {
    
    //MARK: - Properties
    
    static var sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: - Functions
    
    func fetchTasks() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        //look at how to implement this function
        self.tasks = tasks
    }
    
    //MARK: - CRUD
    
    func createTask(name: String, notes: String?) {
        let newTask = Task(name: name, notes: notes)
        tasks.append(newTask)
        CoreDataStack.saveContext()
    }
    
    func updateTask(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    
    func deleteTask(task:Task){
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        CoreDataStack.container.viewContext.delete(task)
        CoreDataStack.saveContext()
    }
        
    func toggleIsComplete(task: Task?) {
        guard let task = task else {return}
        task.isComplete.toggle()
        CoreDataStack.saveContext()
    }
    
    func markTaskAsDone(withID id: String) {
        guard let uuid = UUID(uuidString: id),
              let task = tasks.first(where: {$0.uuid == uuid}) else {return}
    }
}//End of Class
