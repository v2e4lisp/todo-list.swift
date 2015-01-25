//
//  TodoItem.swift
//  TodoList
//
//  Created by wenjun.yan on 1/25/15.
//  Copyright (c) 2015 wenjun.yan. All rights reserved.
//

import Foundation


class TodoItem {
    var name: String
    var completed: Bool
    
    init (name: String) {
        self.name = name
        self.completed = false
    }
    
    func toggole() {
        self.completed = !self.completed
    }
    
}