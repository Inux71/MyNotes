//
//  NoteEditView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 25/04/2023.
//

import SwiftUI

struct NoteEditView: View {
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    @EnvironmentObject var notesStore: NotesStore
    
    @State private var _title: String = ""
    @State private var _noteContent: String = ""
    @State private var _editAlertVisible = false
    
    var note: Note
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                TextField(
                    "Tytuł notatki",
                    text:$_title).font(.system(size: 24).bold()
                )
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
                    _editAlertVisible.toggle()
                }) {
                    Text("Zapisz")
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edytuj notatkę")
            .alert("Czy na pewno chcesz zapisać notatkę?", isPresented: $_editAlertVisible, presenting: note) { note in
                Button(role: .cancel) {
                    _editAlertVisible.toggle()
                } label: {
                    Text("Anuluj")
                }
                
                Button("Zapisz") {
                    let updatedNote = Note(
                        id: self.note.id,
                        content: self._noteContent,
                        title: self._title
                    )
                    
                    self.notesStore.update(note: updatedNote)
                    
                    dismiss()
                }
            }
        }
        .onAppear() {
            self._title = self.note.title
            self._noteContent = self.note.content
        }
    }
}
