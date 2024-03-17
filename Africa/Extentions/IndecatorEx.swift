//
//  IndecatorEx.swift
//  Africa
//
//  Created by Aref on 3/14/24.
//

import Foundation
import SwiftUI
extension View {
    func getWidth() -> CGFloat {
        #if os(iOS) || os(tvOS) || os(watchOS)
            return UIScreen.main.bounds.width
        #elseif os(macOS)
            return NSScreen.main?.frame.width ?? 0
        #endif
    }
}
