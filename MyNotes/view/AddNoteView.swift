//
//  AddNoteView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct AddNoteView: View {
    @State private var title: String = ""
    var onReturnToNoteListView: () -> Void
    
    @State private var noteContent: String = "Treść notatki..."
    
    var body: some View {
        VStack {
            TextField(
                "Tytuł notatki",
                text:$title).font(.custom("HelveticaNeue", size: 28))
                //.frame(maxHeight: 34, alignment: .leading)
                .padding(0)
            
            TextEditor(
                text: $noteContent).font(.custom("HelveticaNeue", size: 16))
                    .lineSpacing(5)
                    .padding(0)
                    
            
        }
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
        onReturnToNoteListView()
    }
    
}



struct AddNoteView_Preview: PreviewProvider{
    static var previews: some View{
        AddNoteView(onReturnToNoteListView: {})
    }
}
