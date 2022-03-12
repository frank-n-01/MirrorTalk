// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The text editor in the bottom half of the screen.
///
struct TextEditorView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        TextEditor(text: $viewModel.message)
            .focused($isFocused)
            .font(.system(size: viewModel.fonts.size,
                          weight: viewModel.fonts.weight.value,
                          design: viewModel.fonts.design.value))
            .multilineTextAlignment(viewModel.texts.alignment.value)
            .disableAutocorrection(!viewModel.texts.isAutocorrectionEnabled)
            .padding(.top, -10.0)
            .padding()
    }
}
