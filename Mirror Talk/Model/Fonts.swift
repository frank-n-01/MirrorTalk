// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct Fonts {
    var size: CGFloat {
        didSet {
            UserDefaults.standard.set(size, forKey: UDKey.fontSize.rawValue)
        }
    }
    
    var weight: FontWeight {
        didSet {
            UserDefaults.standard.set(
                weight.rawValue,
                forKey: UDKey.fontWeight.rawValue
            )
        }
    }
    
    var design: FontDesign {
        didSet {
            UserDefaults.standard.set(
                design.rawValue,
                forKey: UDKey.fontDesign.rawValue
            )
        }
    }
    
    // Default values.
    static let SIZE: CGFloat = 30.0
    static let WEIGHT: FontWeight = .regular
    static let DESIGN: FontDesign = .defaultDesign
    
    /// The range of editable font size.
    static let SIZE_RANGE: ClosedRange<CGFloat> = 10...300
        
    init() {
        let isInitialized = UserDefaults.standard.bool(forKey: UDKey.isInitialized.rawValue)
        
        let size = UserDefaults.standard.double(forKey: UDKey.fontSize.rawValue)
        if Self.SIZE_RANGE.contains(size) {
            self.size = size
        } else {
            self.size = Self.SIZE
        }
        
        let weight = UserDefaults.standard.integer(forKey: UDKey.fontWeight.rawValue)
        if isInitialized {
            self.weight = FontWeight(rawValue: weight) ?? Self.WEIGHT
        } else {
            self.weight = Self.WEIGHT
        }
        
        let design = UserDefaults.standard.integer(forKey: UDKey.fontDesign.rawValue)
        if isInitialized {
            self.design = FontDesign(rawValue: design) ?? Self.DESIGN
        } else {
            self.design = Self.DESIGN
        }
    }
    
    /// Set the default values in the User Defaults.
    mutating func initUD() {
        self.size = Self.SIZE
        self.weight = Self.WEIGHT
        self.design = Self.DESIGN
    }
}
