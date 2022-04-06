// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

/// Show and hide the system keyboard.
struct KeyboardButton: View {
    @FocusState var isFocused: Bool
    
    var body: some View {
        Button {
            isFocused.toggle()
        } label: {
            if isFocused {
                Image(systemName: "keyboard.chevron.compact.down")
            } else {
                Image(systemName: "keyboard")
            }
        }
    }
}
