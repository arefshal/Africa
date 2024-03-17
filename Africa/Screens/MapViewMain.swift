//
//  MapViewMain.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import MapKit
import SwiftUI

// MARK: - Main Map View

struct MapViewMain: View {
    // MARK: - State Properties

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 65.0, longitudeDelta: 65.0)
    )
    // MARK: - Location Data

    let location: [LocationModel] = Bundle.main.decode("locations.json")

    // MARK: - Body

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: location) { item in
            MapAnnotation(coordinate: item.location) {
                CustomAnnotation(loci: item)
            }
        }
        .mapStyle(.standard)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    MapViewMain()
}
