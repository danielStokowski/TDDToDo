//
//  CLLocationCoordinate2D+Equatable.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 20.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable{
    public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool{
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
