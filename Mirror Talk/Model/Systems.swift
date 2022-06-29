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
    
    var isHistoryMode: Bool {
        didSet {
            UserDefaults.standard.set(isHistoryMode, forKey: UDKey.isHistoryMode.rawValue)
        }
    }

    static let HIDE_STATUS_BAR = true
    static let IS_SINGLE_MODE = false
    static let IS_HISTORY_MODE = false

    init() {
        if MirrorTalkViewModel.isInitialized {
            hideStatusBar = UserDefaults.standard.bool(forKey: UDKey.hideStatusBar.rawValue)
            isSingleMode = UserDefaults.standard.bool(forKey: UDKey.isSingleMode.rawValue)
            isHistoryMode = UserDefaults.standard.bool(forKey: UDKey.isHistoryMode.rawValue)
        } else {
            hideStatusBar = Self.HIDE_STATUS_BAR
            isSingleMode = Self.IS_SINGLE_MODE
            isHistoryMode = Self.IS_HISTORY_MODE
            
            // Save the default values.
            UserDefaults.standard.set(Self.HIDE_STATUS_BAR, forKey: UDKey.hideStatusBar.rawValue)
            UserDefaults.standard.set(Self.IS_SINGLE_MODE, forKey: UDKey.isSingleMode.rawValue)
            UserDefaults.standard.set(Self.IS_HISTORY_MODE, forKey: UDKey.isHistoryMode.rawValue)
        }
    }
}
