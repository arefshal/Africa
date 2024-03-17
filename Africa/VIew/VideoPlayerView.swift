//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import AVKit
import SwiftUI
struct VideoPlayerView: View {
    // MARK: - Properties

    var videoSelected: String // Assume this is the filename without extension
    var videoTitle: String

    // MARK: - Body

    var body: some View {
        VStack {
            if let player = VideoPlaybackService.playVideo(named: videoSelected, withFormat: "mp4") {
                VideoPlayer(player: player)
                    .overlay(
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .padding(.top, 6)
                            .padding(.horizontal, 8),
                        alignment: .topLeading
                    )
            } else {
                Text("Video Not Available")
            }
        }
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
}
