//
//  NoteListView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NoteListView: View {
    @State private var _search: String = "";
    
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    NavigationLink("Test", value: "edit")
                }
            }
            .navigationTitle("Notatki")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $_search)
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "doc.badge.plus")
                }
            }
        }
    }
}

struct NodeListView_Preview: PreviewProvider {
    static var previews: some View {
        NoteEditView()
    }
}

//enum NavigationTest {
//    EditNote(test: String)
//    
//}
