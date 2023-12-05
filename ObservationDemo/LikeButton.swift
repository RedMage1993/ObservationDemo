//
//  LikeButton.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/3/23.
//

import Foundation
import SwiftUI

protocol Likeable: AnyObject {
    var title: String { get }
    var isLiked: Bool { get set }
}

struct LikeButton: View {
    let likeable: Likeable
    let action: (() -> ())?
    
    var body: some View {
        let _ = Self._printChanges()
        HStack {
            Text(likeable.title)
            Button {
                action?()
            } label: {
                Text(likeable.isLiked ? "Dislike": "Like")
            }
        }
    }
}
