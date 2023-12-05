//
//  Offer.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/4/23.
//

import Foundation

enum Offer: Identifiable {
    case deal(Deal)
    case coupon(Coupon)
    
    var id: ObjectIdentifier {
        switch self {
        case .deal(let deal):
            deal.id
        case .coupon(let coupon):
            coupon.id
        }
    }
}
