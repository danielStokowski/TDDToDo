//
//  ToDoItemTests.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 18.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
@testable import TDDToDo

class ToDoItemTests: XCTestCase {
    
    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "Foo")
        
        XCTAssertEqual(item.title, "Foo", "should set title")
    }
    
    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(title: "Foo", description: "Bar")
        
        XCTAssertEqual(item.description, "Bar", "should set description")
    }
    
    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(title: "Foo", timestamp: 0.0)
        
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }
    
    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)
        
        XCTAssertEqual(item.location, location)
    }
    
    func test_Equal(){
        let item = ToDoItem(title: "")
        XCTAssertEqual(item, ToDoItem(title: ""))
        XCTAssertNotEqual(item, ToDoItem(title: "Foo"))
        
        let item2 = ToDoItem(title: "Foo", description: "Bar")
        XCTAssertEqual(item2, ToDoItem(title: "Foo", description: "Bar"))
        XCTAssertNotEqual(item2, ToDoItem(title: "Foo", description: "Buzz"))
        
        let item3 = ToDoItem(title: "Foo", description: "Bar", timestamp: 0.0)
        XCTAssertEqual(item3, ToDoItem(title: "Foo", description: "Bar", timestamp: 0.0))
        XCTAssertNotEqual(item2, item3)
        let location = Location(name: "Home")
        let item4 = ToDoItem(title: "Foo", description: "Bar", timestamp: 0.0, location: location)
        XCTAssertEqual(item4, ToDoItem(title: "Foo", description: "Bar", timestamp: 0.0, location: Location(name: "Home")))
        XCTAssertNotEqual(item3, item4)
    }
}
