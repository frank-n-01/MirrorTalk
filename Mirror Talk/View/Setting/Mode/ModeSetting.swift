// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct ModeSetting: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            Toggle("Single Mode", isOn: $viewModel.system.isSingleMode)
                .font(CommonStyle.LABEL_FONT)
        } footer: {
            Text("single_mode_description")
        }
    }
}
