//
//  ContentView.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.offerRepository) var offerRepository
    @State var offers: [Offer] = []
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            ForEach(offers) { offer in
                switch offer {
                case .deal(let deal):
                    HStack {
                        Text("Deal: \(deal.title)")
                        OfferLikeButton(likeable: deal, offer: offer, offerRepository: offerRepository)
                    }
                case .coupon(let coupon):
                    HStack {
                        Text("Coupon: \(coupon.title)")
                        OfferLikeButton(likeable: coupon, offer: offer, offerRepository: offerRepository)
                    }
                }
            }
        }
        .padding()
        .task {
            let offersResult = await offerRepository.getOffers()
            
            switch offersResult {
            case .success(let offers):
                self.offers = offers
            case .failure(_): break
            }
        }
    }
}

#Preview {
    ContentView()
}
