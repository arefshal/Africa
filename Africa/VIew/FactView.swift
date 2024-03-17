//
//  FactView.swift
//  Africa
//
//  Created by Aref on 3/12/24.
//

import SwiftUI

struct FactView: View {
    // MARK: - Properties

    let animal: AnimalModel
    @State private var selectedTab: Int = 0

    // MARK: - Body

    var body: some View {
        GroupBox {
            ZStack(alignment: .bottom) {
                // MARK: - Facts TabView

                TabView(selection: $selectedTab) {
                    ForEach(animal.fact.indices, id: \.self) { item in
                        Text(animal.fact[item])
                            .tag(item)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)

                // MARK: - Page Indicator

                PageIndicator(numPages: animal.fact.count, currentPage: $selectedTab)
                    .padding(.bottom, 10)
            }
        }
    }
}

struct FactView_PreView: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        FactView(animal: animals[1])
    }
}
