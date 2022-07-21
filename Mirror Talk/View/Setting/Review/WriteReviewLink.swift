// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct WriteReviewLink: View {
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        Button {
            if let urlString = Bundle.main.object(
                forInfoDictionaryKey: "Write Review URL") as? String,
               let writeReviewUrl = URL(string: urlString) {
                openURL(writeReviewUrl)
            }
        } label: {
            Label("Write a Review", systemImage: "square.and.pencil")
                .font(CommonStyle.LABEL_FONT)
        }
    }
}
