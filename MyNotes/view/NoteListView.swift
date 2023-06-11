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
            NavigationLink(value: "add") {
                Text("Dodaj notatkę")
            }
        }
    }
}
