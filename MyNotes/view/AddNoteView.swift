//
//  AddNoteView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct AddNoteView: View {
    @State private var title: String = ""
    var onReturnToNteListView: () -> Void
    
    @State private var noteContent: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "Tytuł notatki",
                text:$title).font(.custom("HelveticaNeue", size: 28))
                //.frame(maxHeight: 34, alignment: .leading)
                .padding(15)
            
            TextEditor(
                text: $noteContent).font(.custom("HelveticaNeue", size: 16))
                    .lineSpacing(5)
                    .padding(15)
                    
            
        }
        .navigationTitle("Dodaj notatkę")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Button(action: saveNote) {
                Text("Zapisz")
            }
        }
    }
    
}

private func saveNote(){
    print("Hello there")
}

struct AddNoteView_Preview: PreviewProvider{
    static var previews: some View{
        AddNoteView(onReturnToNteListView: {})
    }
}
