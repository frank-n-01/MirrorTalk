// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI
import CoreData

struct HistoryList: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: History.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \History.date, ascending: false)]
    ) var records: FetchedResults<History>
    
    var body: some View {
        List {
            ForEach(records, id: \.self) { record in
                Text(record.message ?? "")
            }
        }
        .navigationTitle("History")
    }
}
