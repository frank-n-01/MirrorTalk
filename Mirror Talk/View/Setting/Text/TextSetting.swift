// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The setting view for text format and editing.
///
struct TextSetting: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            Picker("", selection: $viewModel.texts.alignment) {
                ForEach(TextAlignments.allCases) { alignment in
                    Image(systemName: alignment.image)
                        .tag(alignment)
                }
            }
            .pickerStyle(.segmented)

            Toggle(
                "Auto Correction",
                isOn: $viewModel.texts.isAutocorrectionEnabled
            ).font(.title3)
        } header: {
            Text("Text")
        }
    }
}
