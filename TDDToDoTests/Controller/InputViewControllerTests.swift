//
//  InputViewControllerTests.swift
//  TDDToDoTests
//
//  Created by Daniel Stokowski on 31.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
import CoreLocation
@testable import TDDToDo

class InputViewControllerTests: XCTestCase {
    
    var sut: InputViewController!
    var placemark: MockPlacemark!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
        
        sut.loadViewIfNeeded()
    }
    
    func test_SUT_NotNil() {
        XCTAssertNotNil(sut)
    }
    
    func test_hasTitleTextField(){
        XCTAssert(sut.titleTextField.isDescendant(of: sut.view))
    }
    
    func test_hasDateTextField(){
        XCTAssert(sut.dateTextField.isDescendant(of: sut.view))
    }
    
    func test_hasLocationTextField(){
        XCTAssert(sut.locationTextField.isDescendant(of: sut.view))
    }
    
    func test_hasAddressTextField(){
        XCTAssert(sut.addressTextField.isDescendant(of: sut.view))
    }
    
    func test_hasDescriptionTextField(){
        XCTAssert(sut.descriptionTextField.isDescendant(of: sut.view))
    }
    
    func test_hasSaveButton(){
        XCTAssert(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func test_hasCancelButton(){
        XCTAssert(sut.cancelButton.isDescendant(of: sut.view))
    }
    
    func test_Save_UsesGeocoderToGetCoordinateFromAddress() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let timestamp = 1456095600.0
        let date = Date(timeIntervalSince1970: timestamp)
        sut.titleTextField.text = "Foo"
        sut.dateTextField.text = dateFormatter.string(from: date)
        sut.locationTextField.text = "Bar"
        sut.addressTextField.text = "Infinite Loop 1, Cupertino"
        sut.descriptionTextField.text = "Baz"
        let mockGeocoder = MockGeocoder()
        sut.geocoder = mockGeocoder
        sut.itemManager = ItemManager()
        sut.save()
        placemark = MockPlacemark()
        let coordinate = CLLocationCoordinate2DMake(37.3316851,
                                                    -122.0300674)
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)
        let item = sut.itemManager?.item(at: 0)
        let testItem = ToDoItem(title: "Foo",
                                description: "Baz",
                                timestamp: timestamp,
                                location: Location(name: "Bar",
                                                   coordinate: coordinate))
        XCTAssertEqual(item, testItem)
    }
    
    func test_SaveButtonHasSaveAction() {
        let saveButton: UIButton = sut.saveButton
        guard let actions = saveButton.actions(
            forTarget: sut,
            forControlEvent: .touchUpInside) else {
                XCTFail(); return
        }
        XCTAssertTrue(actions.contains("save"))
    }
}

extension InputViewControllerTests {
    class MockGeocoder: CLGeocoder {
        
        var completionHandler: CLGeocodeCompletionHandler?
        
        override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }
    
    class MockPlacemark: CLPlacemark {
        
        var mockCoordinate: CLLocationCoordinate2D?
        
        override var location: CLLocation  {
            guard let coordinate = mockCoordinate else
            { return CLLocation() }
            return CLLocation(latitude: coordinate.latitude,
                              longitude: coordinate.longitude)
        }
        
    }
}
