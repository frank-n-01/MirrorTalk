// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The setting view for font size, weight, and design.
///
struct FontSetting: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            sizeStepper
            weightPicker
            designPicker
        } header: {
            Text("Font")
        }
    }
    
    ///
    /// The stepper to increment and decrement the font size.
    ///
    var sizeStepper: some View {
        Stepper(
            value: $viewModel.fonts.size,
            in: Fonts.SIZE_RANGE,
            step: 2.0
        ) {
            Label(
                "\(Int(viewModel.fonts.size)) pt",
                systemImage: "textformat.size"
            ).font(.title3)
        }
    }
    
    ///
    /// The picker to select a font weight.
    ///
    var weightPicker: some View {
        Picker(selection: $viewModel.fonts.weight) {
            ForEach(FontWeight.allCases) { weight in
                Text(weight.name)
                    .font(.system(.title3, design: viewModel.fonts.design.value))
                    .fontWeight(weight.value)
                    .tag(weight)
            }
        } label: {
            Text("Weight")
                .font(.title3)
        }
    }
    
    ///
    /// The picker to select a font design.
    /// 
    var designPicker: some View {
        Picker(selection: $viewModel.fonts.design) {
            ForEach(FontDesign.allCases) { design in
                Text(design.name)
                    .font(.system(.title3, design: design.value))
                    .fontWeight(viewModel.fonts.weight.value)
                    .tag(design)
            }
        } label: {
            Text("Design")
                .font(.title3)
        }
    }
}
