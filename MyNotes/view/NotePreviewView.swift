//
//  NoteEditView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NotePreviewView: View {
    @State var noteEditVisible: Bool = false
    
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.note.content)
                .font(.system(size: 16))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Podgląd - \(self.note.title)")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    noteEditVisible.toggle()
                }) {
                    Text("Edytuj")
                }
            }
        }
        .sheet(isPresented: $noteEditVisible) {
            NavigationStack() {
                NoteEditView(note: note)
            }
        }
    }
}
