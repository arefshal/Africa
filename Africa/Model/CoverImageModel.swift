//
//  CoverImageModel.swift
//  Africa
//
//  Created by Aref on 3/7/24.
//

import Foundation
/// Useful for JSON data decoding and identifying images in a collection.
struct CoverImageModel : Identifiable, Codable {
    var id: Int
    var name : String
}
