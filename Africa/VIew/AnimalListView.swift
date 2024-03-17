//
//  AnimalListView.swift
//  Africa
//
//  Created by Aref on 3/7/24.
//

import SwiftUI

struct AnimalListView: View {
    // MARK: - Properties

    let animal: AnimalModel

    // MARK: - Body

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // Animal Image
            Image(animal.gallery[1])
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(width: 90, height: 90)

            // Animal Name and Headline
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor) // Use `.foregroundColor` for setting text color
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AnimalListView_priview: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListView(animal: animals[1])
    }
}
