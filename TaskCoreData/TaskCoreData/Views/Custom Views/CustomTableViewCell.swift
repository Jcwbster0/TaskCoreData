//
//  CustomTableViewCell.swift
//  TaskCoreData
//
//  Created by Justin Webster on 4/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {

//MARK: - Outlets
    @IBOutlet weak var taskTextLabel: UILabel!
    @IBOutlet weak var isCompletedButton: UIButton!
    
    //MARK: - Properties
    private var isChecked: Bool = false
    weak var delegate: TaskCompletionDelegate?
    
    var task: Task? {
        didSet {
            guard let task = task else {return}
            Configure(task: task)
        }
    }
    
    //MARK: - Functions
    
    func Configure(task: Task) {
        taskTextLabel.text = task.name
        let image = isChecked ? UIImage(systemName: "checkmark.square"): UIImage(systemName: "square")
        isCompletedButton.setImage(image, for: .normal)
        isCompletedButton.tintColor = .black
    }
    
//MARK: - Actions
    @IBAction func isCompletedButtonTapped(_ sender: Any) {
        isChecked.toggle()
        delegate?.taskCellButtonTapped(self)
    }
}
