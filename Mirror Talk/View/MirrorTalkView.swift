// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI
import CoreData

struct MirrorTalkView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @FocusState private var isFocused: Bool
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: History.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \History.date, ascending: false)]
    ) var histories: FetchedResults<History>
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                if !viewModel.system.isSingleMode {
                    ReflectedText(viewModel: viewModel)
                    Divider()
                }
                Text(histories.first?.message ?? "none")
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

    var toolbarButtons: some View {
        Group {
            shareButton
            Spacer()
            KeyboardButton(isFocused: _isFocused)
            Spacer()
            ClearButton {
                viewModel.clear(context)
            }
            Spacer()
            SettingButton(viewModel: viewModel, isFocused: _isFocused)
        }
    }

    var isPad: Bool {
        UIDevice().userInterfaceIdiom == .pad
    }

    var shareButton: some View {
        Group {
            if isPad {
                ShareButtonWithPopover(
                    message: $viewModel.message, isFocused: _isFocused)
            } else {
                ShareButtonWithSheet(
                    message: $viewModel.message, isFocused: _isFocused)
            }
        }
    }
}
