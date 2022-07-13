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
    
    var isAutoSaveEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isAutoSaveEnabled, forKey: UDKey.isAutoSaveEnabled.rawValue)
        }
    }

    static let HIDE_STATUS_BAR = true
    static let IS_SINGLE_MODE = false
    static let IS_AUTO_SAVE_ENABLED = true

    init() {
        if MirrorTalkViewModel.isInitialized {
            hideStatusBar = UserDefaults.standard.bool(forKey: UDKey.hideStatusBar.rawValue)
            isSingleMode = UserDefaults.standard.bool(forKey: UDKey.isSingleMode.rawValue)
            isAutoSaveEnabled = UserDefaults.standard.bool(forKey: UDKey.isAutoSaveEnabled.rawValue)
        } else {
            hideStatusBar = Self.HIDE_STATUS_BAR
            isSingleMode = Self.IS_SINGLE_MODE
            isAutoSaveEnabled = Self.IS_AUTO_SAVE_ENABLED
            
            // Save the default values.
            UserDefaults.standard.set(Self.HIDE_STATUS_BAR, forKey: UDKey.hideStatusBar.rawValue)
            UserDefaults.standard.set(Self.IS_SINGLE_MODE, forKey: UDKey.isSingleMode.rawValue)
            UserDefaults.standard.set(Self.IS_AUTO_SAVE_ENABLED, forKey: UDKey.isAutoSaveEnabled.rawValue)
        }
    }
}
