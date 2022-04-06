// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

enum TextAlignments :Int, CaseIterable, Identifiable {
    case leading
    case center
    case trailing
    
    var id: UUID {
        return UUID()
    }

    var image: String {
        switch self {
        case .leading:
            return "text.alignleft"
        case .center:
            return "text.aligncenter"
        case .trailing:
            return "text.alignright"
        }
    }
    
    var value: TextAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
