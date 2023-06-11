//
//  NoteListView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var notesStore: NotesStore

    var body: some View {
        VStack {
            if self.notesStore.notes.count == 0 {
                Text("Brak notatek 😭")
            }
            
            List {
                ForEach(self.notesStore.notes) { note in
                    NavigationLink(destination: NotePreviewView(note: note)) {
                        HStack {
                            Text(note.title)
                        }
                    }
                }
                .onDelete { idx in
                    self.notesStore.remove(offset: idx)
                }
            }
        }
        .navigationTitle("Notatki")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            if self.notesStore.notes.count != 0 {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            
            ToolbarItem() {
                NavigationLink(value: "add") {
                    Image(systemName: "doc.badge.plus")
                }
            }
        }
    }
}
