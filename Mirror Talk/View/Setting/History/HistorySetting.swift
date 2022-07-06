// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct HistorySetting: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            Group {
                NavigationLink {
                    HistoryList()
                } label: {
                    Label("History", systemImage: "clock")
                }
                Toggle("Auto Save", isOn: $viewModel.system.isAutoSaveEnabled)
            }
            .font(CommonStyle.LABEL_FONT)
        }
    }
}
