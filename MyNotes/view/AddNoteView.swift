//
//  AddNoteView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct AddNoteView: View {
    var onReturnToNteListView: () -> Void
    
    @State private var title: String = "Title"
    
    @State private var noteContent: String = "This is some editable text..."
    
    var body: some View {
        VStack {
            TextField(
                "Add title to your note...",
                text:$title).font(.custom("HelveticaNeue", size: 28))
                //.frame(maxHeight: 34, alignment: .leading)
                .padding(20)
            
            TextEditor(
                text: $noteContent).font(.custom("HelveticaNeue", size: 16))
                    .lineSpacing(5)
                    .padding(20)
            
        }
    }
}


struct AddNoteView_Preview: PreviewProvider{
    static var previews: some View{
        AddNoteView(onReturnToNteListView: {})
    }
}
