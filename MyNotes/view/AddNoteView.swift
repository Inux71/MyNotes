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
    var onReturnToNoteListView: () -> Void
    
    @State private var noteContent: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(
                "Tytuł notatki",
                text:$title).font(.title)
                //.frame(maxHeight: 34, alignment: .leading)
                .padding(0)
            
            VStack(alignment: .leading) {
                TextField("Treść...", text: $noteContent, axis: .vertical)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            Button(action: saveNote) {
                Text("Zapisz")
            }
        }
        .padding()
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
