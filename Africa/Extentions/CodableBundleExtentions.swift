//
//  CodableBundleExtentions.swift
//  Africa
//
//  Created by Aref on 3/7/24.
//

import Foundation

// MARK: - Bundle Decoding Utility

extension Bundle {
    // MARK: - Decode JSON Data
    /// Decodes a JSON file into a `Codable` object.
    /// - Parameters:
    ///   - file: The filename of the JSON file within the Bundle.
    /// - Returns: A `Codable` object of type `T`.
    /// - Throws: `fatalError` if the file cannot be loaded or decoded.
    func decode<T: Codable>(_ file: String) -> T {
        // MARK: - Load JSON File

        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        // MARK: - Load Data from File

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        // MARK: - Decode JSON Data

        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
