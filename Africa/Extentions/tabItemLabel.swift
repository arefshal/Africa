//
//  tabItemLabel.swift
//  Africa
//
//  Created by Aref on 3/17/24.
//

import Foundation
import SwiftUI
/// Simplifies the creation of tab items with labels and system images for `TabView` components.
extension View {
    func tabItemLabel(_ label: String, systemImage: String) -> some View {
        tabItem {
            Label(label, systemImage: systemImage)
        }
    }
}
