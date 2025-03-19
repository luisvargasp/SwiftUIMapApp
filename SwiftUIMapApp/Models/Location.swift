//
//  Location.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 18/03/25.
//

import Foundation
import MapKit

struct Location : Identifiable , Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    var id : String {
        name+cityName
    }
    
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    
}
