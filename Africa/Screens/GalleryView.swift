//
//  GalleryView.swift
//  Africa
//
//  Created by Aref on 3/15/24.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - States

    @State private var gridItemSlide: Double = 3
    @State private var selectImage: String = "lion-1"

    // MARK: - Properties

    let animal: [AnimalModel] = Bundle.main.decode("animals.json")

    // MARK: - Body

    var body: some View {
        let gridItems = Array(repeating: GridItem(.flexible()), count: Int(gridItemSlide))

        ZStack {
            // MARK: - Background

            MotionAnimationView()
                .ignoresSafeArea()

            // MARK: - ScrollView

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Spacer()

                    // MARK: - Selected Image

                    Image(selectImage)
                        .circleImageStyle()
                        .padding(.vertical, 5)

                    // MARK: - Slider

                    Slider(value: $gridItemSlide, in: 1 ... 5, step: 1)

                    // MARK: - Grid of Images

                    LazyVGrid(columns: gridItems, alignment: .center, spacing: 20) {
                        ForEach(animal) { animal in
                            Image(animal.gallery[0])
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(lineWidth: 4)
                                }
                                .onTapGesture {
                                    withAnimation(.spring(duration: 0.9)) {
                                        selectImage = animal.gallery[0]
                                    }
                                }
                        }
                    }

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    GalleryView()
}
