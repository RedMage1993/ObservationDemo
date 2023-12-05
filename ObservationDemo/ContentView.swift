//
//  ContentView.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewModel
    
    @MainActor
    init(offerRepository: OfferRepository) {
        viewModel = ContentViewModel(offerRepository: offerRepository)
    }
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            ForEach(viewModel.offers) { offer in
                LikeButton(likeable: offer.content) {
                    Task {
                        await viewModel.setLike(like: !offer.content.isLiked, on: offer)
                    }
                }
            }
        }
        .padding()
        .task {
            await viewModel.getOffers()
        }
    }
}

#Preview {
    ContentView(offerRepository: DefaultOfferRepository())
}
