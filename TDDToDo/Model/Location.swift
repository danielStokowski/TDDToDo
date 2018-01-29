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
    let coordinates: CLLocationCoordinate2D?
    
    init(name: String, coordinates: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinates = coordinates
    }
}

extension Location : Equatable {
    public static func ==(lhs: Location, rhs: Location) -> Bool{
        return lhs.name == rhs.name && lhs.coordinates == rhs.coordinates
    }
}


