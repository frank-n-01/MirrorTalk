// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The view model to manage the texts and settings.
///
class MirrorTalkViewModel: ObservableObject {
    
    ///
    /// The text message written by the user automatically saved in User Defaults.
    ///
    @Published var message: String {
        didSet {
            UserDefaults.standard.set(
                message,
                forKey: UDKey.message.rawValue
            )
        }
    }
    
    ///
    /// The font style to display the message.
    ///
    @Published var fonts: Fonts
    
    ///
    /// The text style to display and edit the message.
    ///
    @Published var texts: Texts
    
    ///
    /// The system setting properties.
    ///
    @Published var system: Systems
    
    ///
    /// Is the User Defaults values initialized.
    /// 
    static var isInitialized: Bool {
        UserDefaults.standard.bool(
            forKey: UDKey.isInitialized.rawValue
        )
    }
    
    ///
    /// Initialize properties with the User Defaults values.
    ///
    init() {
        self.message = UserDefaults.standard.string(
            forKey: UDKey.message.rawValue
        ) ?? ""
        
        self.fonts = Fonts()
        self.texts = Texts()
        self.system = Systems()
        
        if !Self.isInitialized {
            UserDefaults.standard.set(
                true, forKey: UDKey.isInitialized.rawValue
            )
        }
    }
    
    ///
    /// Clear the current message.
    /// 
    func clear() {
        self.message = ""
    }
}
