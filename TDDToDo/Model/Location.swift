//
//  LocationTests.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 20.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location : Equatable {
    public static func ==(lhs: Location, rhs: Location) -> Bool{
        return lhs.name == rhs.name && lhs.coordinate == rhs.coordinate
    }
}


