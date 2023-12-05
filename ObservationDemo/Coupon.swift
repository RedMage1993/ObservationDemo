//
//  Coupon.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/4/23.
//

import Foundation

@Observable class Coupon: Identifiable {
    let title: String
    var isLiked: Bool
    
    init(title: String, isLiked: Bool) {
        self.title = title
        self.isLiked = isLiked
    }
}

extension Coupon: Likeable {}
