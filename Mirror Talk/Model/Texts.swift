// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct Texts {
    var alignment: TextAlignments {
        didSet {
            UserDefaults.standard.set(
                alignment.rawValue,
                forKey: UDKey.textAlignment.rawValue
            )
        }
    }
    
    var isAutocorrectionEnabled: Bool {
        didSet {
            UserDefaults.standard.set(
                isAutocorrectionEnabled,
                forKey: UDKey.isAutocorrectionEnabed.rawValue
            )
        }
    }
    
    // Default values.
    static let ALIGNMENT: TextAlignments = .leading
    static let IS_AUTOCORRECTION_ENABLED: Bool = true
    
    init() {
        let isInitialized = UserDefaults.standard.bool(forKey: UDKey.isInitialized.rawValue)
        
        let alignment = UserDefaults.standard.integer(forKey: UDKey.textAlignment.rawValue)
        if isInitialized {
            self.alignment = TextAlignments(rawValue: alignment) ?? Self.ALIGNMENT
        } else {
            self.alignment = Self.ALIGNMENT
        }
        
        let isAutocorrectionEnabled = UserDefaults.standard
            .bool(forKey: UDKey.isAutocorrectionEnabed.rawValue)
        if isInitialized {
            self.isAutocorrectionEnabled = isAutocorrectionEnabled
        } else {
            self.isAutocorrectionEnabled = Self.IS_AUTOCORRECTION_ENABLED
        }
    }
    
    /// Set the default values in the User Defaults.
    mutating func initUD() {
        self.alignment = Self.ALIGNMENT
        self.isAutocorrectionEnabled = Self.IS_AUTOCORRECTION_ENABLED
    }
}
