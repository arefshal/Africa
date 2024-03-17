//
//  VideoPlayerHelpet.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import AVKit
import Foundation

// MARK: - Video Playback Service

struct VideoPlaybackService {
    // MARK: - Play Video
    /// Attempts to play a video with the given file name and format.
    /// - Parameters:
    ///   - fileName: The name of the video file without the file extension.
    ///   - fileFormat: The file extension of the video.
    /// - Returns: An optional `AVPlayer` configured to play the specified video if it exists; otherwise, `nil`.
    static func playVideo(named fileName: String, withFormat fileFormat: String) -> AVPlayer? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
            print("Failed to find \(fileName).\(fileFormat) in the app bundle.")
            return nil
        }

        let videoPlayer = AVPlayer(url: url)
        videoPlayer.play()

        return videoPlayer
    }
}
