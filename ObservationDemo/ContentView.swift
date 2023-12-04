//
//  ContentView.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewViewModel
    
    init(dealRepository: DealRepository) {
        viewModel = ContentViewViewModel(dealRepository: dealRepository)
    }
    
    var body: some View {
        let _ = Self._printChanges()
        LikeButton(likeable: $viewModel) {
            viewModel.setLike(like: !viewModel.isLiked)
        }
        .padding()
    }
}

#Preview {
    ContentView(dealRepository: DefaultDealRepository())
}
