//
//  ObservationDemoApp.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/1/23.
//

import SwiftUI

@main
struct ObservationDemoApp: App {
    @Environment(\.dealRepository) var dealRepository
    
    var body: some Scene {
        WindowGroup {
            ContentView(dealRepository: dealRepository)
        }
    }
}
