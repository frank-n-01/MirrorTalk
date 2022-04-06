// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

/// Show the activity view with a sheet for iPhone and others.
struct ShareButtonWithSheet: View {
    @State private var show = false
    @Binding var message: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        Button {
            show.toggle()
            
            // Hide the keyboard.
            isFocused = false
        } label: {
            Image(systemName: "square.and.arrow.up")
        }
        .sheet(isPresented: $show) {
            ShareActivityView([message] as [Any])
        }
    }
}
