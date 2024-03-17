//
//  ContentView.swift
//  Africa
//
//  Created by Aref on 3/7/24.
//

import SwiftUI

// MARK: - ContentView Definition

struct ContentView: View {
    // MARK: - Properties

    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    @State private var activeButton: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

    // MARK: - Grid Switch Method

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count

        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            // MARK: - View Selector

            Group {
                if !activeButton {
                    // MARK: - List View

                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            AnimalListView(animal: animal)
                                .background(
                                    NavigationLink(destination: DetailView(animal: animal)) {
                                    }
                                    .opacity(0)
                                )
                        }
                    }
                } else {
                    // MARK: - Grid View

                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: DetailView(animal: animal)) {
                                    AnimalGridView(animals: animal)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Africa")

            // MARK: - Toolbar Configuration

            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // MARK: - Toolbar Buttons

                    HStack(spacing: 16) {
                        Button(action: {
                            haptic.impactOccurred()
                            activeButton = false
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(activeButton ? .secondary : .primary)
                        }
                        Button(action: {
                            haptic.impactOccurred()
                            activeButton = true
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(activeButton ? .primary : .secondary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
