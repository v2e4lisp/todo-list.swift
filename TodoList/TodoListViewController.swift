//
//  TodoListViewController.swift
//  TodoList
//
//  Created by wenjun.yan on 1/23/15.
//  Copyright (c) 2015 wenjun.yan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var todoItems: [TodoItem] = []
    
    func loadInitialData() {
        todoItems.append(TodoItem(name: "item1"))
        todoItems.append(TodoItem(name: "item2"))
        todoItems.append(TodoItem(name: "item3"))
        todoItems.append(TodoItem(name: "item4"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return todoItems.count
    }
    
    // override func cellForRowAtIndexPath
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        let from = segue.sourceViewController as AddTodoItemViewController
        
        if let todoItem = from.todoItem {
            todoItems.append(todoItem)
        }
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        let item = todoItems[indexPath.row]
        
        // update text
        cell.textLabel!.text = item.name
        
        // toggle accessory type
        if item.completed {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // toggle
        todoItems[indexPath.row].toggle()
        
        // reload
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
        // deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
}
