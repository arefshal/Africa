//
//  VideoModel.swift
//  Africa
//
//  Created by Aref on 3/13/24.
//

import Foundation
/// This model is structured for easy JSON decoding and identification within collections
struct VideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
