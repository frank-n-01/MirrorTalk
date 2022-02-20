// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            Form {
                FontSettingView(viewModel: viewModel)
                TextSettingView(viewModel: viewModel)
                SystemSettingView(viewModel: viewModel)
            }
            .navigationTitle("Setting")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    doneButton
                }
            }
        }
    }
    
    /// Dismiss the setting view.
    var doneButton: some View {
        Button {
            show = false
        } label: {
            Text("Done")
                .bold()
        }
    }
}
