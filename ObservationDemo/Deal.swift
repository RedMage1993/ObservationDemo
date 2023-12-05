//
//  Deal.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation

@Observable class Deal: Identifiable {
    let title: String
    var isLiked: Bool
    
    init(title: String, isLiked: Bool) {
        self.title = title
        self.isLiked = isLiked
    }
}
