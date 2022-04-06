// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct ReflectedText: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        GeometryReader { _ in
            ScrollView {
                Text(viewModel.message)
                    .font(.system(size: viewModel.fonts.size,
                                  weight: viewModel.fonts.weight.value,
                                  design: viewModel.fonts.design.value))
                    .multilineTextAlignment(viewModel.texts.alignment.value)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .padding(.horizontal, 5.0)
                    .padding(.top, -5.0)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: alignment
                    )
            }
        }
        .rotationEffect(.degrees(180))
    }

    var alignment: Alignment {
        switch viewModel.texts.alignment {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
