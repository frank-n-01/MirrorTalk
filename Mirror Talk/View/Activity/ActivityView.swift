// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    let items: [Any]
    let activities: [UIActivity]?
    
    init(_ items: [Any], _ activities: [UIActivity]? = nil) {
        self.items = items
        self.activities = activities
    }
    
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ActivityView>
    ) -> UIActivityViewController {
        UIActivityViewController(activityItems: items,
                                 applicationActivities: activities)
    }
    
    func updateUIViewController(
        _ uiViewController: UIActivityViewController,
        context: UIViewControllerRepresentableContext<ActivityView>) {}
}
