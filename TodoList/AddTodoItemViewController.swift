//
//  AddTodoItemViewController.swift
//  TodoList
//
//  Created by wenjun.yan on 1/23/15.
//  Copyright (c) 2015 wenjun.yan. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    var todoItem: TodoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender as? UIBarButtonItem != saveButton {
            return
        }
        
        if textField.text.isEmpty {
            return
        }
        
        todoItem = TodoItem(name: textField.text)
    }

}
