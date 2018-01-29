//
//  ItemManagerTests.swift
//  TDDToDoTests
//
//  Created by Daniel Stokowski on 20.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
@testable import TDDToDo

class ItemManagerTests: XCTestCase {
    
    var sut: ItemManager!
    
    override func setUp() {
        sut = ItemManager()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_ToDoCount_InitiallyIsZero() {
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func test_DoneCount_Initially_IsZero() {
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func test_AddItem_IncreasesToDoCountToOne() {
        sut.add(ToDoItem(title: ""))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
    
    func test_TwoTimesAddItem_IncreasesToDoCountToTwo() {
        sut.add(ToDoItem(title: "Foo"))
        XCTAssertEqual(sut.toDoCount, 1)
        
        sut.add(ToDoItem(title: "Bar"))
        XCTAssertEqual(sut.toDoCount, 2)
    }
    
    func test_ItemAt_ReturnedAddedItem() {
        let item = ToDoItem(title: "")
        sut.add(item)
        
        let returnedItem = sut.item(at: 0)
        
        XCTAssertEqual(item, returnedItem)
    }
    
    func test_ItemAt_ReturnedAddedItem2() {
        let item = ToDoItem(title: "Foo")
        sut.add(item)
        
        let returnedItem = sut.item(at: 0)
        
        XCTAssertEqual(item, returnedItem)
    }
    
    func test_CheckItemAt_ChangesCounts() {
        let item = ToDoItem(title: "")
        sut.add(item)
        
        sut.checkItem(at: 0)
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }
    
    func test_CheckItemAt_RemovesItFromToDoItems() {
        
        sut.add(ToDoItem(title: "First"))
        sut.add(ToDoItem(title: "Second"))
        
        sut.checkItem(at: 0)
        XCTAssertEqual(sut.item(at: 0).title, "Second")
    }
    
    func test_DoneItemAt_ReturnedCheckedItem() {
        
        sut.add(ToDoItem(title: "First"))
        sut.checkItem(at: 0)
        
        let done = sut.doneItem(at: 0)
        XCTAssertEqual(done.title, "First")
    }
    
    func test_RemoveAllItems_ResultsInCountsBeZero() {
        sut.add(ToDoItem(title: "First"))
        sut.add(ToDoItem(title: "Second"))
        sut.checkItem(at: 0)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func test_WhenItemIsAlreadAdded_DoesNotIncreaseCount(){
        sut.add(ToDoItem(title: "First"))
        sut.add(ToDoItem(title: "First"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}
