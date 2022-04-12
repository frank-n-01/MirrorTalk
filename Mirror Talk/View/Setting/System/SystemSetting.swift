// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct SystemSetting: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            Toggle("Single Mode", isOn: $viewModel.system.isSingleMode)
                .font(CommonStyle.LABEL_FONT)
            
            Toggle("Hide Status Bar", isOn: $viewModel.system.hideStatusBar)
                .font(CommonStyle.LABEL_FONT)
        } header: {
            Text("System")
        }
    }
}
