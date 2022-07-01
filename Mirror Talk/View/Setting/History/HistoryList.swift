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
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(record.message ?? "")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text(DateFormatter.localizedString(
                            from: record.date ?? Date(),
                            dateStyle: .medium, timeStyle: .none))
                        Spacer()
                        Text(DateFormatter.localizedString(
                            from: record.date ?? Date(),
                            dateStyle: .none, timeStyle: .medium))
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                }
                .padding(.vertical, 5.0)
            }
        }
        .navigationTitle("History")
        .navigationBarTitleDisplayMode(.large)
        .listStyle(.plain)
    }
}
