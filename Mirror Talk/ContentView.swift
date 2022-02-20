// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MirrorTalkViewModel()
    
    var body: some View {
        MirrorTalkView(viewModel: viewModel)
    }
}
