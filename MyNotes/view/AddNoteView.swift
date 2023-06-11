//
//  AddNoteView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct AddNoteView: View {
    @EnvironmentObject var notesStore: NotesStore
    @State private var title: String = ""
    @State private var noteContent: String = ""
    @State private var isPrivate: Bool = false
    
    var onReturnToNoteListView: () -> Void
    
    var body: some View {
        List {
            TextField(
                "Tytuł notatki",
                text: $title
            )
            
            Section("Szczegóły") {
                TextField("Treść", text: $noteContent, axis: .vertical)
                    .frame(maxHeight: .infinity)
                
                Toggle(isOn: $isPrivate) {
                    Text("Notatka prywatna")
                }
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
    
    private func saveNote(){
        print("Hello there")
        notesStore.insert(note: Note(content:noteContent, title:title))
        onReturnToNoteListView()
    }
    
}



struct AddNoteView_Preview: PreviewProvider{
    static var previews: some View{
        AddNoteView(onReturnToNoteListView: {})
    }
}
