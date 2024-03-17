//
//  HeadingView.swift
//  Africa
//
//  Created by Aref on 3/11/24.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - Properties
    var headingImage: String
    var headingText: String

    // MARK: - Body
    var body: some View {
        // MARK: - Content Layout
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle", headingText: "Wilderness in picture")
}
