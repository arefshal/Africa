//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Aref on 3/15/24.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - State Variables
    @State private var randomCircle: Int = Int.random(in: 12 ... 16)
    @State private var isAnimating: Bool = false

    // MARK: - Randomization Functions
    func randomCoordinate() -> CGFloat {
        CGFloat.random(in: 0 ... 500)
    }

    func randomSize() -> CGFloat {
        CGFloat.random(in: 60 ... 200)
    }

    func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1 ... 2.0)
    }

    func randomSpeed() -> Double {
        Double.random(in: 0.05 ... 1)
    }

    func randomDelay() -> Double {
        Double.random(in: 0 ... 2)
    }

    func randomOpacity() -> Double {
        Double.random(in: 0.1 ... 0.2)
    }

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0 ..< randomCircle, id: \.self) { _ in
                    Circle()
                        .fill(Color.white.opacity(randomOpacity()))
                        .frame(width: randomSize(), height: randomSize())
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // Initial position
                        .offset(x: randomCoordinate() - geometry.size.width / 2,
                                y: randomCoordinate() - geometry.size.height / 2) // Random offset from center
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .animation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay()),
                            value: isAnimating
                        )
                }
            }
            .onAppear {
                isAnimating = true
            }
        }
        .drawingGroup() // Optimizes the rendering of complex view hierarchies.
    }
}
#Preview {
    MotionAnimationView()
}
