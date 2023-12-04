//
//  ContentView.swift
//  ObservationDemo
//
//  Created by Fritz Ammon on 12/1/23.
//

import SwiftUI

struct ContentView<ViewModel: ContentViewViewModel & Likeable>: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        let _ = Self._printChanges()
        LikeButton(likeable: $viewModel) {
            viewModel.setLike(like: viewModel.isLiked)
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: DefaultContentViewViewModel(dealRepository: DefaultDealRepository()))
}
