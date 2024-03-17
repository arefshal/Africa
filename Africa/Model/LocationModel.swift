//
//  LocationModel.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import Foundation
import MapKit
/// facilitating map integrations. This model is designed for JSON compatibility and can be uniquely identified.
struct LocationModel: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
