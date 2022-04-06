// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct Fonts {
    
    var size: CGFloat {
        didSet {
            UserDefaults.standard.set(
                size,
                forKey: UDKey.fontSize.rawValue
            )
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

    static let SIZE: CGFloat = 30.0
    static let WEIGHT: FontWeight = .regular
    static let DESIGN: FontDesign = .defaultDesign
    static let SIZE_RANGE: ClosedRange<CGFloat> = 10...1000
    
    init() {
        if MirrorTalkViewModel.isInitialized {
            let size = UserDefaults.standard
                .double(forKey: UDKey.fontSize.rawValue)
            
            if Self.SIZE_RANGE.contains(size) {
                self.size = size
            } else {
                self.size = Self.SIZE
            }
            
            self.weight = FontWeight(rawValue: UserDefaults.standard
                    .integer(forKey: UDKey.fontWeight.rawValue)) ?? Self.WEIGHT
            
            self.design = FontDesign(rawValue: UserDefaults.standard
                .integer(forKey: UDKey.fontDesign.rawValue)) ?? Self.DESIGN
        } else {
            self.size = Self.SIZE
            self.weight = Self.WEIGHT
            self.design = Self.DESIGN
            
            // Save the default values.
            UserDefaults.standard.set(Self.SIZE,forKey: UDKey.fontSize.rawValue)
            UserDefaults.standard.set(Self.WEIGHT.rawValue,forKey: UDKey.fontWeight.rawValue)
            UserDefaults.standard.set(Self.DESIGN.rawValue,forKey: UDKey.fontDesign.rawValue)
        }
    }
}
