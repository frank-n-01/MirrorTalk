// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct HiddenShareButton: View {
    var message: String
    
    var body: some View {
        if UIDevice().userInterfaceIdiom == .pad {
            HiddenShareButtonWithPopover(message: message)
        } else {
            HiddenShareButtonWithSheet(message: message)
        }
    }
}

struct HiddenShareButtonWithSheet: View {
    var message: String
    @State private var show = false
    
    var body: some View {
        Button("") {
            show.toggle()
        }
        .sheet(isPresented: $show) {
            ActivityView([message] as [Any])
        }
    }
}

struct HiddenShareButtonWithPopover: View {
    var message: String
    @State private var show = false
    
    var body: some View {
        Button("") {
            show.toggle()
        }
        .popover(isPresented: $show) {
            ActivityView([message] as [Any])
        }
    }
}
