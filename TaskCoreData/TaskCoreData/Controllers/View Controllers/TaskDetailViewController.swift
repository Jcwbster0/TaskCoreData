//
//  TaskDetailViewController.swift
//  TaskCoreData
//
//  Created by Justin Webster on 4/27/21.
//


import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskDetailTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       updateView()
    }
    
    //MARK: - Properties
    var date: Date?
    var task: Task?
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskTitleTextField.text, !name.isEmpty,
              let notes = taskDetailTextView.text, !notes.isEmpty,
              let date = taskDueDatePicker?.date else {return}
        
        if let task = task {
            TaskController.sharedInstance.updateTask(task: task, name: name, notes: notes, dueDate: date)
        } else {
            TaskController.sharedInstance.createTask(name: name, notes: notes)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        self.date = taskDueDatePicker.date
    }
    
    
    //MARK: - Functions
    
    func updateView() {
        guard let task = task else {return}
        taskTitleTextField.text = task.name
        taskDetailTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
}//End of Class
