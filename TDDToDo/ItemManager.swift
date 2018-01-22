//
//  ItemManager.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 20.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount: Int {
        return toDoItems.count
    }
    private var toDoItems: [ToDoItem] = []
    
    var doneCount: Int {
        return doneItems.count
    }
    private var doneItems: [ToDoItem] = []
    
    
    func add(_ item: ToDoItem){
        if !toDoItems.contains(item){
            toDoItems.append(item)
        }
    }
    
    func item(at index: Int) -> ToDoItem{
        return toDoItems[index]
    }
    
    func checkItem(at index: Int){
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }
    
    func doneItem(at index: Int) -> ToDoItem{
        return doneItems[index]
    }
    
    func removeAll(){
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}
