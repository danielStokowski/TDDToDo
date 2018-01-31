//
//  Location.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 20.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
import CoreLocation
@testable import TDDToDo

class LocationTests: XCTestCase {
    
    func test_Init_SetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func test_Init_WhenGivenCoordinates_SetsCoordinates() {
        let location = Location(name: "",
                                coordinate: CLLocationCoordinate2D(latitude: 1, longitude: 2))
        XCTAssertEqual(location.coordinate!, CLLocationCoordinate2DMake(1, 2))
    }
    
    func test_Equal(){
        let location = Location(name: "Foo", coordinate: CLLocationCoordinate2DMake(2, 3))
        let location2 = Location(name: "Bar", coordinate: CLLocationCoordinate2DMake(0, 2))
        
        XCTAssertEqual(location, Location(name: "Foo", coordinate: CLLocationCoordinate2DMake(2, 3)))
        XCTAssertEqual(location2, Location(name: "Bar", coordinate: CLLocationCoordinate2DMake(0, 2)))
    }
}
