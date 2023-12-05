//
//  Offer+Likeable.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/5/23.
//

import Foundation

extension Deal: Likeable {}
extension Coupon: Likeable {}

extension Offer {
    var content: Likeable {
        switch self {
        case .deal(let deal):
            deal
        case .coupon(let coupon):
            coupon
        }
    }
}
