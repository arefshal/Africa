//
//  DeatailView.swift
//  Africa
//
//  Created by Aref on 3/11/24.
//

import SwiftUI

struct DetailView: View {
    let animal: AnimalModel

    var body: some View {
        // MARK: - ScrollView Container

        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - Main Content VStack

            VStack(alignment: .center, spacing: 20) {
                // MARK: - Animal Image

                Image(animal.gallery[0])
                    .resizable()
                    .scaledToFit()

                // MARK: - Animal Name

                Text(animal.name.uppercased())
                // Other modifiers...

                // MARK: - Animal Headline

                Text(animal.headline)
                // Other modifiers...

                // MARK: - Wilderness in Pictures

                Group {
                    HeadingView(headingImage: "photo.on.rectangle", headingText: "Wilderness in Pictures")
                    AnimalGalleryView(animal: animal)
                }

                // MARK: - Did You Know?

                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did You Know?")
                    FactView(animal: animal)
                }

                // MARK: - All About Animal

                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All About \(animal.name)")
                    Text(animal.description)
                    // Other modifiers...
                }

                // MARK: - National Parks

                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    MapViews()
                }

                // MARK: - Learn More

                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    // Link and other UI elements...
                }
                .padding(.horizontal)
            }
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DeatailView_Preview: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        DetailView(animal: animals[1])
    }
}
