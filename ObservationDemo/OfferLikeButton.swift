//
//  OfferLikeButton.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/4/23.
//

import Foundation
import SwiftUI

struct OfferLikeButton<T: Likeable>: View {
    let likeable: T
    let offer: Offer
    let offerRepository: OfferRepository
    
    var body: some View {
        let _ = Self._printChanges()
        LikeButton(likeable: likeable) {
            let like = !likeable.isLiked
            
            likeable.isLiked.toggle()
            
            Task {
                let likeResult = await offerRepository.setLike(like: like, on: offer)
                
                switch likeResult {
                case .success(_): break
                case .failure(_):
                    likeable.isLiked.toggle()
                }
            }
        }
    }
}
