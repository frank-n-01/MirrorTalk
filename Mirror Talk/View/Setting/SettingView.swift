// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            Form {
                FontSetting(viewModel: viewModel)
                TextSetting(viewModel: viewModel)
                ModeSetting(viewModel: viewModel)
                SystemSetting(viewModel: viewModel)
                HistorySetting(viewModel: viewModel)
            }
            .navigationTitle("Setting")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        show = false
                    } label: {
                        Text("Done")
                            .bold()
                    }
                }
            }
        }
    }
}
