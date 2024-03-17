//
//  VideoListItem.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import SwiftUI

struct VideoListItem: View {
    // MARK: - Properties
    let video: VideoModel

    // MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            // MARK: - Thumbnail with Play Icon
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10)) 
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 34)
                    .shadow(radius: 4)
            }
            // MARK: - Video Details
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItem_PreView: PreviewProvider {
    static let videos: [VideoModel] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItem(video: videos[0])
    }
}
