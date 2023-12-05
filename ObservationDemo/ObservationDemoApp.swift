//
//  ObservationDemoApp.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/1/23.
//

import SwiftUI

@main
struct ObservationDemoApp: App {
    @Environment(\.offerRepository) var offerRepository
    
    var body: some Scene {
        WindowGroup {
            ContentView(offerRepository: offerRepository)
        }
    }
}
