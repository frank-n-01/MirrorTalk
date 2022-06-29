// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct HistorySetting: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    
    var body: some View {
        Section {
            Group {
                Toggle("Auto Save", isOn: $viewModel.system.isHistoryMode)
                
                NavigationLink {
                    HistoryList()
                } label: {
                    Text("Record")
                }
            }
            .font(CommonStyle.LABEL_FONT)
        } header: {
            Text("History")
        }
    }
}
