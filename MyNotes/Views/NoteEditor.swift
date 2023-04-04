//
//  NoteEditor.swift
//  MyNotes
//
//  Created by Kolodziejski, Piotr on 04/04/2023.
//

import SwiftUI

struct NoteEditor: View {
    @State private var fullText: String = "This is some editable text..."
    
    

    var body: some View {
        
        TextEditor(text: $fullText).font(.custom("HelveticaNeue", size: 13))
        .lineSpacing(5)
        .padding(20)
    }
}

struct NoteEditor_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditor()
    }
}
