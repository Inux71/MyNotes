//
//  NoteEditView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 25/04/2023.
//

import SwiftUI

struct NoteEditView: View {
    var note: Note
    
    @EnvironmentObject var notesStore: NotesStore
    
    @State private var _title: String = ""
    @State private var _noteContent: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                TextField(
                    "Tytuł notatki",
                    text:$_title).font(.title)
                    .padding(0)
                
                VStack(alignment: .leading) {
                    TextField("Treść...", text: $_noteContent, axis: .vertical)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                Button(action: {
                    let updatedNote = Note(id: self.note.id, content: self._noteContent, title: self._title)
                    
                    self.notesStore.update(note: updatedNote)
                }) {
                    Text("Zapisz")
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Dodaj notatkę")
        }
        .onAppear() {
            self._title = self.note.title
            self._noteContent = self.note.content
        }
    }
}
