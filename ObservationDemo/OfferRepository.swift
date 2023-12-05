//
//  OfferRepository.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation

enum OfferRepositoryError: Error {
    case unknown
}

protocol OfferRepository: AnyObject, Observable {
    func getOffers() async -> Result<[Offer], OfferRepositoryError>
    func setLike(like: Bool, on offer: Offer) async -> Result<Bool, OfferRepositoryError>
}

actor DefaultOfferRepository: OfferRepository {
    func getOffers() async -> Result<[Offer], OfferRepositoryError> {
        try? await Task.sleep(until: .now + .seconds(0.5))
        
        return .success([
            .deal(Deal(title: "$1 Pizza", isLiked: false)),
            .deal(Deal(title: "$2 Scooter", isLiked: false)),
            .coupon(Coupon(title: "ABC", isLiked: false)),
        ])
    }
    
    func setLike(like: Bool, on offer: Offer) async -> Result<Bool, OfferRepositoryError> {
        try? await Task.sleep(until: .now + .seconds(0.5))
        
        // For demo, only allow coupon state change
        // Simulate failure for the rest
        switch offer {
        case .coupon(_):
            return .success(like)
        default:
            return .failure(.unknown)
        }
    }
}
