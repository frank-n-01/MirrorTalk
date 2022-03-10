// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct MirrorTalkView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                if !viewModel.isSingleMode {
                    MirroredTextView(viewModel: viewModel)
                    Divider()
                }
                TextEditorView(viewModel: viewModel, isFocused: _isFocused)
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    toolbarButtons
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    toolbarButtons
                    Spacer()
                }
            }
            .statusBar(hidden: viewModel.hideStatusBar)
        }
    }
    
    var toolbarButtons: some View {
        Group {
            shareButton
            Spacer()
            ShowKeyboardButton(isFocused: _isFocused)
            Spacer()
            ClearTextButton(clear: viewModel.clear)
            Spacer()
            SettingButtonWithSheet(viewModel: viewModel, isFocused: _isFocused)
        }
    }
    
    /// Whether the type of device is iPad.
    var isPad: Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }
    
    /// Share the message using system provided activities.
    var shareButton: some View {
        Group {
            if isPad {
                ShareButtonWithPopover(message: $viewModel.message, isFocused: _isFocused)
            } else {
                ShareButtonWithSheet(message: $viewModel.message, isFocused: _isFocused)
            }
        }
    }
}
