// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI

struct ShareActivityView: UIViewControllerRepresentable {
    
    /// The collection of items to be shared.
    let items: [Any]
    
    /// Custom activities that will be added to the share sheet.
    let activities: [UIActivity]?
    
    init(_ items: [Any], _ activities: [UIActivity]? = nil) {
        self.items = items
        self.activities = activities
    }
    
    /// Return a new view controller for the activity view.
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ShareActivityView>
    ) -> UIActivityViewController {
        return UIActivityViewController(
            activityItems: items,
            applicationActivities: activities
        )
    }
    
    /// Required but do nothing.
    func updateUIViewController(
        _ uiViewController: UIActivityViewController,
        context: UIViewControllerRepresentableContext<ShareActivityView>
    ) {}
}
