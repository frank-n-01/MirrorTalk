// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The font weight property.
///
enum FontWeight: Int, CaseIterable, Identifiable {
    case ultraLight
    case thin
    case light
    case regular
    case medium
    case semibold
    case bold
    case heavy
    case black
    
    ///
    /// The ID for the font weight picker.
    ///
    var id: UUID {
        return UUID()
    }
    
    ///
    /// The name displayed in the font weight picker.
    ///
    var name: LocalizedStringKey {
        switch self {
        case .ultraLight:
            return "ultraLight"
        case .thin:
            return "thin"
        case .light:
            return "light"
        case .regular:
            return "regular"
        case .medium:
            return "medium"
        case .semibold:
            return "semibold"
        case .bold:
            return "bold"
        case .heavy:
            return "heavy"
        case .black:
            return "black"
        }
    }
    
    ///
    /// The font weight value to used in the view modifier.
    ///
    var value: Font.Weight {
        switch self {
        case .ultraLight:
            return .ultraLight
        case .thin:
            return .thin
        case .light:
            return .light
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .semibold:
            return .semibold
        case .bold:
            return .bold
        case .heavy:
            return .heavy
        case .black:
            return .black
        }
    }
}
