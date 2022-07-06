// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI
import CoreData

class MirrorTalkViewModel: ObservableObject {
    @Published var message: String {
        didSet {
            UserDefaults.standard.set(
                message, forKey: UDKey.message.rawValue)
        }
    }
    
    @Published var fonts: Fonts
    @Published var texts: Texts
    @Published var system: Systems
    
    static var isInitialized: Bool {
        UserDefaults.standard.bool(
            forKey: UDKey.isInitialized.rawValue)
    }
    
    static let DEFAULT_MESSAGE = "😊 "
    
    init() {
        self.message = UserDefaults.standard.string(
            forKey: UDKey.message.rawValue) ?? Self.DEFAULT_MESSAGE
        
        self.fonts = Fonts()
        self.texts = Texts()
        self.system = Systems()
        
        if !Self.isInitialized {
            UserDefaults.standard.set(true, forKey: UDKey.isInitialized.rawValue)
        }
    }
    
    /// Clear the message and save it if the history mode is ON.
    func clear(_ context: NSManagedObjectContext) {
        if message.isEmpty { return }
        
        guard system.isAutoSaveEnabled else {
            message = ""
            return
        }
        
        let history = History(context: context)
        history.message = message
        history.date = Date()
        message = ""
        
        if context.hasChanges {
            try? context.save()
        }
    }
}
