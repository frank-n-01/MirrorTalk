// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

class MirrorTalkViewModel: ObservableObject {
    
    @Published var message: String {
        didSet {
            UserDefaults.standard.set(
                message,
                forKey: UDKey.message.rawValue
            )
        }
    }
    
    @Published var fonts: Fonts
    
    @Published var texts: Texts
    
    @Published var system: Systems
    
    static var isInitialized: Bool {
        UserDefaults.standard.bool(
            forKey: UDKey.isInitialized.rawValue
        )
    }
    
    init() {
        self.message = UserDefaults.standard.string(
            forKey: UDKey.message.rawValue
        ) ?? ""
        
        self.fonts = Fonts()
        self.texts = Texts()
        self.system = Systems()
        
        if !Self.isInitialized {
            UserDefaults.standard.set(true, forKey: UDKey.isInitialized.rawValue)
        }
    }
    
    func clear() {
        self.message = ""
    }
}
