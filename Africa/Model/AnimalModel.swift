//
//  AnimalModel.swift
//  Africa
//
//  Created by Aref on 3/7/24.
//

import Foundation
/// Represents detailed information about an animal, including metadata and multimedia assets.
struct AnimalModel : Identifiable , Codable {
    let id : String
    let name : String
    let headline : String
    let description : String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
}
