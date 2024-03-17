//
//  MainView.swift
//  Africa
//
//  Created by Aref on 3/15/24.
//

import SwiftUI

// MARK: - Main Application View

struct MainView: View {
    // MARK: - State Properties

    @State private var isShowingSplash = true

    // MARK: - View Body

    var body: some View {
        ZStack {
            // MARK: - Main Tab View

            TabView {
                // MARK: - Content View Tab

                ContentView().tabItemLabel("Browse", systemImage: "square.grid.2x2")

                // MARK: - Video List View Tab

                VideoListView().tabItemLabel("Watch", systemImage: "play.rectangle")

                // MARK: - Map View Tab

                MapViewMain().tabItemLabel("Locations", systemImage: "map")

                // MARK: - Gallery View Tab

                GalleryView().tabItemLabel("Gallery", systemImage: "photo")
            }
            .zIndex(0)

            // MARK: - Splash Screen Handling

            if isShowingSplash {
                CreditsView()
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .zIndex(1)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isShowingSplash = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
