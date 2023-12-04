//
//  EnvironmentValues.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation
import SwiftUI

struct DealRepositoryKey: EnvironmentKey {
    static var defaultValue: DealRepository = DefaultDealRepository()
}

extension EnvironmentValues {
    var dealRepository: DealRepository {
        get { self[DealRepositoryKey.self] }
        set { self[DealRepositoryKey.self] = newValue }
    }
}
