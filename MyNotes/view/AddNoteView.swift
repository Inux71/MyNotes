//
//  AddNoteView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    @EnvironmentObject var notesStore: NotesStore
    
    @State private var title: String = ""
    @State private var noteContent: String = ""
    
    var body: some View {
        List {
            TextField(
                "Tytuł notatki",
                text: $title
            )
            
            Section("Szczegóły") {
                TextField("Treść", text: $noteContent, axis: .vertical)
                    .frame(maxHeight: .infinity)
            }
        }
        .toolbar {
            Button(action: saveNote) {
                Text("Zapisz")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Dodaj notatkę")
    }
    
    private func saveNote() {
        notesStore.insert(note: Note(content:noteContent, title:title))
        dismiss()
    }
    
}
