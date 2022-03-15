// Copyright © 2022 Ni Fu. All rights reserved.

import Foundation

///
/// The system setting properties.
///
struct Systems {
    
    ///
    /// Is the hide-status-bar mode enabled, automatically saved in User Defaults.
    ///
    var hideStatusBar: Bool {
        didSet {
            UserDefaults.standard.set(
                hideStatusBar,
                forKey: UDKey.hideStatusBar.rawValue
            )
        }
    }
    
    ///
    /// Is the single mode enabled, automatically saved in User Defaults..
    ///
    var isSingleMode: Bool {
        didSet {
            UserDefaults.standard.set(
                isSingleMode,
                forKey: UDKey.isSingleMode.rawValue
            )
        }
    }
    
    ///
    /// The default ON / OFF of the hide-status-bar mode.
    ///
    static let HIDE_STATUS_BAR: Bool = true
    
    ///
    /// The default ON / OFF of the single mode.
    ///
    static let IS_SINGLE_MODE: Bool = false
    
    ///
    /// Initialize properties with the User Defaults values.
    ///
    init() {
        if MirrorTalkViewModel.isInitialized {
            self.hideStatusBar = UserDefaults.standard.bool(
                forKey: UDKey.hideStatusBar.rawValue
            )
            
            self.isSingleMode = UserDefaults.standard.bool(
                forKey: UDKey.isSingleMode.rawValue
            )
        } else {
            self.hideStatusBar = Self.HIDE_STATUS_BAR
            self.isSingleMode = Self.IS_SINGLE_MODE
            
            UserDefaults.standard.set(
                Self.HIDE_STATUS_BAR,
                forKey: UDKey.hideStatusBar.rawValue
            )
            UserDefaults.standard.set(
                Self.IS_SINGLE_MODE,
                forKey: UDKey.isSingleMode.rawValue
            )
        }
    }
}
