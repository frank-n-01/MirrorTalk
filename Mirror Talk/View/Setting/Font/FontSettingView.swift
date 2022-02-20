// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct FontSettingView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            fontSizeStepper
            fontWeightPicker
            fontDesignPicker
        } header: {
            Text("Font")
        }
    }
    
    var fontSizeStepper: some View {
        Stepper(value: $viewModel.fonts.size, in: Fonts.SIZE_RANGE, step: 2.0) {
            Label("\(Int(viewModel.fonts.size)) pt", systemImage: "textformat.size")
                .font(.title3)
        }
    }
    
    var fontWeightPicker: some View {
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
    
    var fontDesignPicker: some View {
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
