//
//  LikeButton.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation
import SwiftUI

protocol Likeable {
    var isLiked: Bool { get set }
}

struct LikeButton<T: Likeable>: View {
    @Binding var likeable: T
    let action: (() -> ())?
    
    var body: some View {
        let _ = Self._printChanges()
        Button {
            action?()
        } label: {
            Text(likeable.isLiked ? "Dislike": "Like")
        }
    }
}
