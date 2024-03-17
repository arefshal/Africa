//
//  AnimalGaleryView.swift
//  Africa
//
//  Created by Aref on 3/11/24.
//

import SwiftUI

struct AnimalGalleryView: View {
    // MARK: - Properties

    var animal: AnimalModel

    // MARK: - Body

    var body: some View {
        // MARK: - Scroll View

        ScrollView(.horizontal, showsIndicators: false) {
            // MARK: - Image Stack

            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))                 }
            }
        }
    }
}

struct AnimalGaleryView_Preview: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGalleryView(animal: animals[1])
    }
}
