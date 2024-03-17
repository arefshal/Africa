//
//  VideoListView.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import SwiftUI

// MARK: - Video List View
struct VideoListView: View {
    // MARK: - Properties
    @State var video: [VideoModel] = Bundle.main.decode("videos.json")
    let hapitic = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                // MARK: - Video List Items
                ForEach(video) { item in
                    VideoListItem(video: item)
                        .background(
                            NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                            }
                            .opacity(0)
                        )
                }
            }
            .listStyle(.plain)
            .navigationTitle("Video")
            .navigationBarTitleDisplayMode(.inline)
            // MARK: - Toolbar
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // MARK: - Shuffle Videos Action
                        video.shuffle()
                        hapitic.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        }
    }
}

#Preview {
    VideoListView()
}
