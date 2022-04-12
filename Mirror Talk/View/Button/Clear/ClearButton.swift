// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

/// Clear the text message.
struct ClearButton: View {
    var clear: () -> Void
    
    var body: some View {
        Button {
            clear()
        } label: {
            Image(systemName: "xmark")
        }
    }
}
