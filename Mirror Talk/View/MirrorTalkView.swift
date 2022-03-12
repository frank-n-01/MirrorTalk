// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The main view of texts and tool bar buttons.
///
struct MirrorTalkView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                if !viewModel.system.isSingleMode {
                    ReflectedText(viewModel: viewModel)
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
            .statusBar(hidden: viewModel.system.hideStatusBar)
        }
    }
    
    ///
    /// The four buttons in the tool bar.
    ///
    var toolbarButtons: some View {
        Group {
            shareButton
            Spacer()
            KeyboardButton(isFocused: _isFocused)
            Spacer()
            ClearButton(clear: viewModel.clear)
            Spacer()
            SettingButton(viewModel: viewModel, isFocused: _isFocused)
        }
    }
    
    ///
    /// Whether the type of current device is iPad.
    ///
    var isPad: Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }
    
    ///
    /// Share the message using the system provided activities.
    ///
    var shareButton: some View {
        Group {
            if isPad {
                ShareButtonWithPopover(
                    message: $viewModel.message, isFocused: _isFocused
                )
            } else {
                ShareButtonWithSheet(
                    message: $viewModel.message, isFocused: _isFocused
                )
            }
        }
    }
}
