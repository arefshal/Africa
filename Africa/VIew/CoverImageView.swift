//
//  CoverImageView.swift
//  Africa
//
//  Created by Aref on 3/7/24.
//

import SwiftUI

// MARK: - Cover Image View for Displaying Page-Based Image Gallery

struct CoverImageView: View {
    // MARK: - Properties

    var coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
    @State private var selectedTab: Int = 0
    @State private var isLoading = true

    // MARK: - View Body

    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .listRowInsets(EdgeInsets())

                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            isLoading = false
                        }
                    }
            } else {
                TabView(selection: $selectedTab) {
                    ForEach(coverImages) { coverImage in
                        Image(coverImage.name)
                            .resizable()
                            .scaledToFit()
                            .tag(coverImage.id)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                VStack {
                    Spacer()
                    PageIndicator(numPages: coverImages.count, currentPage: $selectedTab)
                        .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    CoverImageView()
}
