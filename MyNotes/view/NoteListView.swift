//
//  NoteListView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var notesStore: NotesStore
    @State private var _search: String = "";
    
    var body: some View {
        VStack {
            List(notesStore.notes) { note in
                NavigationLink(destination: NotePreviewView(note: note)) {
                    HStack {
                        Text(note.title)
                    }
                }
            }
        }
        .navigationTitle("Notatki")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $_search)
        .toolbar {
            NavigationLink(value: "add") {
                Image(systemName: "doc.badge.plus")
            }
        }
    }
}
