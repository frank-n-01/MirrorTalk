// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct WriteReviewButton: View {
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        Button {
            if let urlString = Bundle.main.object(
                forInfoDictionaryKey: "Write Review URL") as? String,
               let url = URL(string: urlString) {
                openURL(url)
            }
        } label: {
            Label("Write a Review", systemImage: "square.and.pencil")
                .font(CommonStyle.LABEL_FONT)
        }
    }
}
