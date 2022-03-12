// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The text alignment property.
///
enum TextAlignments :Int, CaseIterable, Identifiable {
    case leading
    case center
    case trailing
    
    var id: UUID {
        return UUID()
    }
        
    ///
    /// The system image name for each alignment.
    /// 
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
    
    ///
    /// The text alignment value to used in the view modifier.
    ///
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
