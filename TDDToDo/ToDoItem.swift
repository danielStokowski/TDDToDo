//
//  ToDoItem.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 19.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let description: String?
    let timestamp: Double?
    let location: Location?
    
    init(title: String,
         description: String? = nil,
         timestamp: Double? = nil,
         location: Location? = nil) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }
}

extension ToDoItem : Equatable {
    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool{
        return lhs.title == rhs.title && lhs.description == rhs.description && lhs.timestamp == rhs.timestamp && lhs.location == rhs.location
    }
}
