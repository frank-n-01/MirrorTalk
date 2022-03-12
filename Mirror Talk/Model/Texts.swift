// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The text format and editing properties.
///
struct Texts {
    
    ///
    /// The text alignment property automatically saved in User Defaults.
    ///
    var alignment: TextAlignments {
        didSet {
            UserDefaults.standard.set(
                alignment.rawValue,
                forKey: UDKey.textAlignment.rawValue
            )
        }
    }
    
    ///
    /// The ON / OFF of the auto-correction function automatically saved in User Defaults.
    ///
    var isAutocorrectionEnabled: Bool {
        didSet {
            UserDefaults.standard.set(
                isAutocorrectionEnabled,
                forKey: UDKey.isAutocorrectionEnabed.rawValue
            )
        }
    }
    
    ///
    /// The default text alignment selection.
    ///
    static let ALIGNMENT: TextAlignments = .leading
    
    ///
    /// The default ON / OFF of the auto-correction function.
    /// 
    static let IS_AUTOCORRECTION_ENABLED: Bool = true
    
    ///
    /// Initialize properties with the User Defaults values.
    ///
    init() {
        if MirrorTalkViewModel.isInitialized {
            self.alignment = TextAlignments(
                rawValue: UserDefaults.standard.integer(
                    forKey: UDKey.textAlignment.rawValue
                )
            ) ?? Self.ALIGNMENT
            
            self.isAutocorrectionEnabled = UserDefaults.standard.bool(
                forKey: UDKey.isAutocorrectionEnabed.rawValue
            )
        } else {
            self.alignment = Self.ALIGNMENT
            self.isAutocorrectionEnabled = Self.IS_AUTOCORRECTION_ENABLED
        }
    }
}
