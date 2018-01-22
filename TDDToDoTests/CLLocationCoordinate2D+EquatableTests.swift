//
//  CLLocationCoordinate2D+EquatableTests.swift
//  TDDToDoTests
//
//  Created by Daniel Stokowski on 20.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import XCTest
import CoreLocation

class CLLocationCoordinate2D_EquatableTests: XCTestCase {
    
    func test_Equal() {
        let coordinate = CLLocationCoordinate2DMake(0, 1)
        let coordinate2 = CLLocationCoordinate2DMake(1, 5)
        
        XCTAssertEqual(coordinate, CLLocationCoordinate2DMake(0, 1))
        XCTAssertEqual(coordinate2, CLLocationCoordinate2DMake(1, 5))
        
        XCTAssertNotEqual(coordinate, CLLocationCoordinate2DMake(0, 0))
        XCTAssertNotEqual(coordinate2, CLLocationCoordinate2DMake(1, 4))
        
    }
}
