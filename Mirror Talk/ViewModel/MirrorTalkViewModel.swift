// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

class MirrorTalkViewModel: ObservableObject {
    /// The text message written by the user.
    @Published var message: String {
        didSet {
            if message != oldValue {
                UserDefaults.standard.set(
                    message,
                    forKey: UDKey.message.rawValue
                )
            }
        }
    }
    
    /// The font style to display the message.
    @Published var fonts: Fonts
    
    /// The text style to display and edit the message
    @Published var texts: Texts
    
    /// Hide the system status bar or not.
    @Published var hideStatusBar: Bool {
        didSet {
            UserDefaults.standard.set(
                hideStatusBar,
                forKey: UDKey.hideStatusBar.rawValue
            )
        }
    }
    
    @Published var isSingleMode: Bool {
        didSet {
            UserDefaults.standard.set(
                isSingleMode,
                forKey: UDKey.isSingleMode.rawValue
            )
        }
    }
    
    init() {
        self.message = UserDefaults.standard
            .string(forKey: UDKey.message.rawValue) ?? ""
        self.fonts = Fonts()
        self.texts = Texts()
        self.hideStatusBar = UserDefaults.standard
            .bool(forKey: UDKey.hideStatusBar.rawValue)
        self.isSingleMode = UserDefaults.standard
            .bool(forKey: UDKey.isSingleMode.rawValue)
        
        let isInitialized = UserDefaults.standard
            .bool(forKey: UDKey.isInitialized.rawValue)
        
        if !isInitialized {
            UserDefaults.standard.set(true, forKey: UDKey.isInitialized.rawValue)
            self.fonts.initUD()
            self.texts.initUD()
            self.hideStatusBar = true
            self.isSingleMode = false
        }
    }
    
    /// Clear the current message.
    func clear() {
        self.message = ""
    }
}
