//
//  AnimalGridView.swift
//  Africa
//
//  Created by Aref on 3/15/24.
//

import SwiftUI

struct AnimalGridView: View {
    let animals: AnimalModel
    var body: some View {
        Image(animals.gallery[0])
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
        
    }
}
