//
//  CreditsView.swift
//  Africa
//
//  Created by Aref on 3/15/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128, height: 128)

                Text("""
                Copyright © Aref Shalchi
                All right reserved
                 ♡
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
            } //: VSTACK
            .padding()
        }
    }
}

#Preview {
    CreditsView()
}
