// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct ShareButton: View {
    @Binding var message: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        if UIDevice().userInterfaceIdiom == .pad {
            ShareButtonWithPopover(message: $message, isFocused: _isFocused)
        } else {
            ShareButtonWithSheet(message: $message, isFocused: _isFocused)
        }
    }
}

struct ShareButtonWithSheet: View {
    @State private var show = false
    @Binding var message: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        Button {
            show.toggle()
            isFocused = false
        } label: {
            Image(systemName: "square.and.arrow.up")
        }
        .sheet(isPresented: $show) {
            ActivityView([message] as [Any])
        }
    }
}

struct ShareButtonWithPopover: View {
    @State private var show = false
    @Binding var message: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        Button {
            show.toggle()
            isFocused = false
        } label: {
            Image(systemName: "square.and.arrow.up")
        }
        .popover(isPresented: $show) {
            ActivityView([message] as [Any])
        }
    }
}
