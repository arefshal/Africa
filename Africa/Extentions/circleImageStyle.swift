//
//  circleImageStyle.swift
//  Africa
//
//  Created by Aref on 3/17/24.
//

import Foundation
import SwiftUI
/// An extension on `Image` to apply a circular style with a white stroke and shadow.
extension Image {
    func circleImageStyle() -> some View {
        resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}
