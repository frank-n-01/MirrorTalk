// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct SendMailButton: View {
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        Button {
            if let urlString = Bundle.main.object(
                forInfoDictionaryKey: "Mail Support URL") as? String,
               let url = URL(string: urlString) {
                openURL(url)
            }
        } label: {
            Label("Email Support", systemImage: "questionmark.circle")
                .font(CommonStyle.LABEL_FONT)
        }
    }
}
