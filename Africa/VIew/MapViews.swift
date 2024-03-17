//
//  MapViews.swift
//  Africa
//
//  Created by Aref on 3/12/24.
//

import MapKit
import SwiftUI
struct MapViews: View {
    // MARK: - Properties

    @State private var rigone = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))

    // MARK: - Body

    var body: some View {
        Map {
            Marker("africa", coordinate: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599))
        }
        .tint(.accent)
        .overlay(
            NavigationLink(destination: MapViews()) {
                HStack {
                    Image(systemName: "mappin.circle")
                        .foregroundColor(Color.white)
                        .imageScale(.large)

                    Text("Locations")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                } //: HSTACK
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .background(
                    Color.black
                        .opacity(0.4)
                        .cornerRadius(8)
                )
            } //: NAVIGATION
            .padding(12)
            , alignment: .topTrailing
        )
        .frame(height: 256)
        .clipShape(.rect(cornerRadius: 20))
        .mapStyle(.standard)
    }
}

#Preview {
    MapViews()
}
