//
//  NoteListView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var notesStore: NotesStore
    @State private var _searchText: String = ""
    
    private var _searchedNotes: [Note] {
        if self._searchText.isEmpty {
            return self.notesStore.notes
        } else {
            return self.notesStore.notes.filter {
                $0.title.contains(self._searchText)
            }
        }
    }

    var body: some View {
        VStack {
            List {
                ForEach(self._searchedNotes) { note in
                    NavigationLink(destination: NotePreviewView(note: note)) {
                        HStack {
                            Text(note.title)
                        }
                    }
                }
                .onDelete { idx in
                    notesStore.remove(offset: idx)
                }
            }
        }
        .navigationTitle("Notatki")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $_searchText)
        .toolbar {
            NavigationLink(value: "add") {
                Image(systemName: "doc.badge.plus")
            }
        }
    }
}
