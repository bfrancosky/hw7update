//
//  LocationLookup.swift
//  GeoCalculator
//
//  Created by Brian on 5/29/18.
//  Copyright © 2018 Jonathan Engelsma. All rights reserved.
//

import UIKit
import Foundation

struct LocationLookup {
    var origLat:Double
    var origLng:Double
    var destLat:Double
    var destLng:Double
    var timestamp:Date
        
    init(origLat:Double, origLng:Double, destLat:Double, destLng:Double,
            timestamp:Date) {
        self.origLat = origLat
        self.origLng = origLng
        self.destLat = destLat
        self.destLng = destLng
        self.timestamp = timestamp
    }
}

