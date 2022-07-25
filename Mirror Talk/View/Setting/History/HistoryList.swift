// Copyright © 2022 Ni Fu. All rights reserved.

import SwiftUI
import CoreData

struct HistoryList: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: History.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \History.date, ascending: false)]
    ) var records: FetchedResults<History>
    
    @State private var searchText = ""

    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { record in
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(record.message ?? "")
                        .font(.headline)
                        .foregroundColor(.primary)
                    HStack {
                        Text(DateFormatter.localizedString(
                            from: record.date ?? Date(),
                            dateStyle: .long, timeStyle: .none))
                        HiddenShareButton(message: record.message ?? "")
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
            .onDelete { offsets in
                guard !searchResults.isEmpty else { return }
                for i in offsets {
                    context.delete(searchResults[i])
                }
                if context.hasChanges {
                    try? context.save()
                }
            }
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("History")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $searchText)
        .listStyle(.plain)
    }
    
    var searchResults: [History] {
        records.filter { history in
            guard !searchText.isEmpty else { return true }
            return history.message?.localizedStandardContains(searchText) ?? false
        }
    }
}
