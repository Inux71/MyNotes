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
                NavigationLink(value: "add") {
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
            Button("Dodaj") {
                notesStore.insert(note: Note(content: "XD", title: "Tytuł"))
            }
        }
    }
}

struct NodeListView_Preview: PreviewProvider {
    static var previews: some View {
        NoteEditView()
    }
}
