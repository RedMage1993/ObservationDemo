//
//  DealRepository.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation

enum DealRepositoryError: Error {
    case unknown
}

protocol DealRepository {
    func getDeal() async -> Result<Deal, DealRepositoryError>
    func setLike(like: Bool) async -> Result<Bool, DealRepositoryError>
}

class DefaultDealRepository: DealRepository {
    func getDeal() async -> Result<Deal, DealRepositoryError> {
        try? await Task.sleep(until: .now + .seconds(0.5))
        
        return .success(Deal(isLiked: false))
    }
    
    func setLike(like: Bool) async -> Result<Bool, DealRepositoryError> {
        try? await Task.sleep(until: .now + .seconds(0.5))
        
        // Simulate failure
        return .failure(.unknown)
    }
}
