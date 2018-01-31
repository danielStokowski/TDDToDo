//
//  DetailViewControllerTests.swift
//  TDDToDoTests
//
//  Created by Daniel Stokowski on 30.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
import MapKit
@testable import TDDToDo

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        sut.loadViewIfNeeded()
    }
    
    func test_HasTitleLabel() {
        XCTAssert(sut.titleLabel.isDescendant(of: sut.view))
    }
    
    func test_HasDateLabel() {
        XCTAssert(sut.dateLabel.isDescendant(of: sut.view))
    }
    
    func test_HasLocationNameLabel() {
        XCTAssert(sut.locationNameLabel.isDescendant(of: sut.view))
    }
    
    func test_HasDescriptionLabel() {
        XCTAssert(sut.descriptionLabel.isDescendant(of: sut.view))
    }
    
    func test_HasMapView() {
        XCTAssert(sut.mapView.isDescendant(of: sut.view))
    }
    
    func test_SettingItemInfo_SetsTextsToLabels() {
        
        let coordinate = CLLocationCoordinate2DMake(51.2277, 6.7735)
        let location = Location(name: "Foo", coordinate: coordinate)
        let item = ToDoItem(title: "Bar",
                            description: "Baz",
                            timestamp: 1456150025,
                            location: location)
        let itemManager = ItemManager()
        itemManager.add(item)
        sut.itemInfo = (itemManager, 0)
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertEqual(sut.titleLabel.text, "Bar")
        XCTAssertEqual(sut.dateLabel.text, "02/22/2016")
        XCTAssertEqual(sut.locationNameLabel.text, "Foo")
        XCTAssertEqual(sut.descriptionLabel.text, "Baz")
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude,
                       coordinate.latitude,
                       accuracy: 0.001)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude,
                       coordinate.longitude,
                       accuracy: 0.001)
        
        
    }
    func test_HasCheckItemButton(){
        XCTAssert(sut.checkItemButton.isDescendant(of: sut.view))
    }

    func test_CheckItem_ChecksItemInItemManager(){
        let itemManager = ItemManager()
        itemManager.add(ToDoItem(title: "Foo"))
        sut.itemInfo = (itemManager,0)
        
        sut.checkItem()

        XCTAssertEqual(itemManager.toDoCount, 0)
        XCTAssertEqual(itemManager.doneCount,1)

    }
}
