//
//  ContentViewViewModel.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation

@Observable class ContentViewViewModel: Likeable {
    private let dealRepository: DealRepository
    
    private var deal: Deal? {
        didSet {
            setup()
        }
    }
    
    var isLiked = false
    
    init(dealRepository: DealRepository) {
        self.dealRepository = dealRepository
        
        Task {
            let dealResult = await dealRepository.getDeal()
            
            switch dealResult {
            case .success(let deal):
                self.deal = deal
            case .failure(_):
                // Fake error handling
                self.deal = Deal(isLiked: false)
            }
        }
    }
    
    private func setup() {
        guard let deal else { return }
        
        isLiked = deal.isLiked
    }
    
    func setLike(like: Bool) {
        Task {
            let result = await dealRepository.setLike(like: like)
            
            switch result {
            case .success(let liked):
                isLiked = liked
            case .failure(_):
                // Fake error handling
                isLiked = !like
            }
        }
    }
}
