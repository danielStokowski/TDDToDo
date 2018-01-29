//
//  ItemListViewControllerTests.swift
//  TDDToDoTests
//
//  Created by Daniel Stokowski on 22.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
@testable import TDDToDo

class ItemListViewControllerTests: XCTestCase {
    
    var sut: ItemListViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let viewController =
            storyboard.instantiateViewController(
                withIdentifier: "ItemListViewController")
        sut = viewController
            as! ItemListViewController
        
        sut.loadViewIfNeeded()
    }
    
    func test_test_TableView_AfterViewDidLoad_IsNotNil() {
      
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
    
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }
    
    func test_LoadingView_TableViewDelegateIsTheSameAsDataSource(){
        XCTAssertEqual(sut.tableView.delegate as? ItemListDataProvider, sut.tableView.dataSource as? ItemListDataProvider)
    }
    
}
