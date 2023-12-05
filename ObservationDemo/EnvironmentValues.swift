//
//  EnvironmentValues.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation
import SwiftUI

struct OfferRepositoryKey: EnvironmentKey {
    static var defaultValue: OfferRepository = DefaultOfferRepository()
}

extension EnvironmentValues {
    var offerRepository: OfferRepository {
        get { self[OfferRepositoryKey.self] }
        set { self[OfferRepositoryKey.self] = newValue }
    }
}
