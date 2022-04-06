// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

enum FontDesign: Int, CaseIterable, Identifiable {
    case defaultDesign
    case monospaced
    case rounded
    case serif
    
    var id: UUID {
        return UUID()
    }

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
