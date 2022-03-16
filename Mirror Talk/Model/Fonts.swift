// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The font size, weight, and design properties.
///
struct Fonts {
    
    ///
    /// The font size automatically saved in User Defaults.
    ///
    var size: CGFloat {
        didSet {
            UserDefaults.standard.set(
                size,
                forKey: UDKey.fontSize.rawValue
            )
        }
    }
    
    ///
    /// The font weight automatically saved in User Defaults.
    ///
    var weight: FontWeight {
        didSet {
            UserDefaults.standard.set(
                weight.rawValue,
                forKey: UDKey.fontWeight.rawValue
            )
        }
    }
    
    ///
    /// The font design automatically saved in User Defaults.
    ///
    var design: FontDesign {
        didSet {
            UserDefaults.standard.set(
                design.rawValue,
                forKey: UDKey.fontDesign.rawValue
            )
        }
    }
    
    ///
    /// The default font size.
    ///
    static let SIZE: CGFloat = 30.0
    
    ///
    /// The default font weight.
    ///
    static let WEIGHT: FontWeight = .regular
    
    ///
    /// The default font design.
    ///
    static let DESIGN: FontDesign = .defaultDesign
    
    ///
    /// The range of editable font size.
    ///
    static let SIZE_RANGE: ClosedRange<CGFloat> = 10...1000
    
    ///
    /// Initialize properties with the User Defaults values.
    ///
    init() {
        if MirrorTalkViewModel.isInitialized {
            let size = UserDefaults.standard.double(
                forKey: UDKey.fontSize.rawValue
            )
            
            if Self.SIZE_RANGE.contains(size) {
                self.size = size
            } else {
                self.size = Self.SIZE
            }
            
            self.weight = FontWeight(
                rawValue: UserDefaults.standard.integer(
                    forKey: UDKey.fontWeight.rawValue
                )
            ) ?? Self.WEIGHT
            
            self.design = FontDesign(
                rawValue: UserDefaults.standard.integer(
                    forKey: UDKey.fontDesign.rawValue
                )
            ) ?? Self.DESIGN
        } else {
            self.size = Self.SIZE
            self.weight = Self.WEIGHT
            self.design = Self.DESIGN
            
            // Save the default values.
            UserDefaults.standard.set(
                Self.SIZE,
                forKey: UDKey.fontSize.rawValue
            )
            UserDefaults.standard.set(
                Self.WEIGHT.rawValue,
                forKey: UDKey.fontWeight.rawValue
            )
            UserDefaults.standard.set(
                Self.DESIGN.rawValue,
                forKey: UDKey.fontDesign.rawValue
            )
        }
    }
}
