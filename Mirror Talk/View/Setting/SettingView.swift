// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

///
/// The setting modal view presented in a sheet.
///
struct SettingView: View {
    @ObservedObject var viewModel: MirrorTalkViewModel
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            Form {
                FontSetting(viewModel: viewModel)
                TextSetting(viewModel: viewModel)
                SystemSetting(viewModel: viewModel)
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
    
    ///
    /// Dismiss the setting view.
    /// 
    var doneButton: some View {
        Button {
            show = false
        } label: {
            Text("Done")
                .bold()
        }
    }
}
