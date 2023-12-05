//
//  LikeButton.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation
import SwiftUI

protocol Likeable: AnyObject {
    var isLiked: Bool { get set }
}

struct LikeButton<T: Likeable>: View {
    let likeable: T
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
