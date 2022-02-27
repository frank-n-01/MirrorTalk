// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct SystemSettingView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            Toggle("Single Mode", isOn: $viewModel.isSingleMode).font(.title3)
            Toggle("Hide Status Bar", isOn: $viewModel.hideStatusBar).font(.title3)
        } header: {
            Text("System")
        }
    }
}
