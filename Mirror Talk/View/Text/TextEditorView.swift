// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct TextEditorView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        TextEditor(text: $viewModel.message)
            .focused($isFocused)
            .font(.system(size: viewModel.fonts.size,
                          weight: viewModel.fonts.weight.value,
                          design: viewModel.fonts.design.value))
            .keyboardType(.default)
            .multilineTextAlignment(viewModel.texts.alignment.value)
            .disableAutocorrection(!viewModel.texts.isAutocorrectionEnabled)
            .padding()
            .padding(.top, -8.0)
    }
}
