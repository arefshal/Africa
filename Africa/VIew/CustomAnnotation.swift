//
//  CustomAnnotation.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import SwiftUI

struct CustomAnnotation: View {
    // MARK: - Properties

    var loci: LocationModel
    @State private var animation: Double = 0.0

    // MARK: - Body

    var body: some View {
        // MARK: - Annotation Design

        ZStack {
            // Background pulsing circle
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)

            // Foreground static circle
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            // Location image
            Image(loci.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        // Animation
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct CustomAnnotation_PreView: PreviewProvider {
    static var loc: [LocationModel] = Bundle.main.decode("locations.json")
    static var previews: some View {
        CustomAnnotation(loci: loc[0])
    }
}
