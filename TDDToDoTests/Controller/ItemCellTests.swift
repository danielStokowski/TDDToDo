//
//  ItemCellTests.swift
//  TDDToDoTests
//
//  Created by Daniel Stokowski on 29.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
@testable import TDDToDo

class ItemCellTests: XCTestCase {
    
    var cell: ItemCell!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard
            .instantiateViewController(withIdentifier: "ItemListViewController")
            as! ItemListViewController
        controller.loadViewIfNeeded()
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        cell = tableView?.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: IndexPath(row: 0, section: 0)) as! ItemCell
    }
    
    func test_HasNameLabel() {
        
        XCTAssert(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func test_HasLocationLabel() {
        XCTAssert(cell.locationLabel.isDescendant(of: cell.contentView))
    }
    
    func test_HasDateLabel() {
        XCTAssert(cell.dateLabel.isDescendant(of: cell.contentView))
    }
    
    func test_configCell_SetsTitle() {
        cell.configCell(with: ToDoItem(title: "Foo"))
        
        XCTAssertEqual(cell.titleLabel.text, "Foo")
    }
    
    func test_configCell_SetsDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: "08/27/2017")
        let timestamp = date?.timeIntervalSince1970
        cell.configCell(with: ToDoItem(title: "Foo",
                                       timestamp: timestamp))
        XCTAssertEqual(cell.dateLabel.text, "08/27/2017")
    }
    
    func test_configCell_SetsLocation() {
        cell.configCell(with: ToDoItem(title: "Foo", location: Location(name: "Home")))
        
        XCTAssertEqual(cell.locationLabel.text, "Home")
    }
    
    func test_Title_WhenItemIsChecked_IsStrokeThrough() {
        let location = Location(name: "Bar")
        let item = ToDoItem(title: "Foo",
                            description: nil,
                            timestamp: 1456150025,
                            location: location)
        cell.configCell(with: item, checked: true)
        let attributedString = NSAttributedString(
            string: "Foo",
            attributes: [NSAttributedStringKey.strikethroughStyle:
                NSUnderlineStyle.styleSingle.rawValue])
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
        XCTAssertNil(cell.locationLabel.text)
        XCTAssertNil(cell.dateLabel.text)
    }
}

extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
