// Copyright © 2022 Ni Fu. All rights reserved.

import Foundation

struct Systems {

    var hideStatusBar: Bool {
        didSet {
            UserDefaults.standard.set(hideStatusBar, forKey: UDKey.hideStatusBar.rawValue)
        }
    }

    var isSingleMode: Bool {
        didSet {
            UserDefaults.standard.set(isSingleMode, forKey: UDKey.isSingleMode.rawValue)
        }
    }

    static let HIDE_STATUS_BAR: Bool = true
    static let IS_SINGLE_MODE: Bool = false

    init() {
        if MirrorTalkViewModel.isInitialized {
            self.hideStatusBar = UserDefaults.standard.bool(forKey: UDKey.hideStatusBar.rawValue)
            self.isSingleMode = UserDefaults.standard.bool(forKey: UDKey.isSingleMode.rawValue)
        } else {
            self.hideStatusBar = Self.HIDE_STATUS_BAR
            self.isSingleMode = Self.IS_SINGLE_MODE
            
            // Save the default values.
            UserDefaults.standard.set(Self.HIDE_STATUS_BAR, forKey: UDKey.hideStatusBar.rawValue)
            UserDefaults.standard.set(Self.IS_SINGLE_MODE, forKey: UDKey.isSingleMode.rawValue)
        }
    }
}
