//
//  ContentViewModel.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/5/23.
//

import Foundation

@MainActor
@Observable class ContentViewModel {
    private let offerRepository: OfferRepository
    
    var offers: [Offer] = []
    
    init(offerRepository: OfferRepository) {
        self.offerRepository = offerRepository
    }
    
    func getOffers() async {
        let offersResult = await offerRepository.getOffers()
        
        switch offersResult {
        case .success(let offers):
            self.offers = offers
        case .failure(_): break
        }
    }
    
    func setLike(like: Bool, on offer: Offer) async {
        let like = !offer.content.isLiked
        
        // Immediate view update
        offer.content.isLiked.toggle()
        
        let likeResult = await offerRepository.setLike(like: like, on: offer)
        
        switch likeResult {
        case .success(_): break
        case .failure(_):
            // Simulate undo view update
            offer.content.isLiked.toggle()
        }
    }
}
