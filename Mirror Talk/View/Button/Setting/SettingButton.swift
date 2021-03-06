// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

/// Show the setting modal view in a sheet.
struct SettingButton: View {
    @State private var show = false
    @ObservedObject var viewModel: MirrorTalkViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        Button {
            show.toggle()
            
            // Hide the keyboard.
            isFocused = false
        } label: {
            Image(systemName: "ellipsis.circle.fill")
        }
        .sheet(isPresented: $show) {
            SettingView(viewModel: viewModel, show: $show)
        }
    }
}
