// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct Texts {
    var alignment: TextAlignments {
        didSet {
            UserDefaults.standard.set(alignment.rawValue, forKey: UDKey.textAlignment.rawValue)
        }
    }

    var isAutocorrectionEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isAutocorrectionEnabled, forKey: UDKey.isAutocorrectionEnabed.rawValue)
        }
    }

    static let ALIGNMENT: TextAlignments = .leading
    static let IS_AUTOCORRECTION_ENABLED: Bool = true

    init() {
        if MirrorTalkViewModel.isInitialized {
            self.alignment = TextAlignments(rawValue: UserDefaults.standard.integer(
                forKey: UDKey.textAlignment.rawValue)) ?? Self.ALIGNMENT
            self.isAutocorrectionEnabled = UserDefaults.standard.bool(
                forKey: UDKey.isAutocorrectionEnabed.rawValue)
        } else {
            self.alignment = Self.ALIGNMENT
            self.isAutocorrectionEnabled = Self.IS_AUTOCORRECTION_ENABLED
            
            // Save the default values.
            UserDefaults.standard.set(Self.ALIGNMENT.rawValue, forKey: UDKey.textAlignment.rawValue)
            UserDefaults.standard.set(Self.IS_AUTOCORRECTION_ENABLED, forKey: UDKey.isAutocorrectionEnabed.rawValue)
        }
    }
}
