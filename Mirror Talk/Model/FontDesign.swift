// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The font design property.
///
enum FontDesign: Int, CaseIterable, Identifiable {
    case defaultDesign
    case monospaced
    case rounded
    case serif
    
    ///
    /// The ID for the font design picker.
    ///
    var id: UUID {
        return UUID()
    }
    
    ///
    /// The name displayed in the font design picker.
    ///
    var name: LocalizedStringKey {
        switch self {
        case .defaultDesign:
            return "default"
        case .monospaced:
            return "monospaced"
        case .rounded:
            return "rounded"
        case .serif:
            return "serif"
        }
    }
    
    ///
    /// The font design value to used in the view modifier.
    /// 
    var value: Font.Design {
        switch self {
        case .defaultDesign:
            return .default
        case .monospaced:
            return .monospaced
        case .rounded:
            return .rounded
        case .serif:
            return .serif
        }
    }
}
