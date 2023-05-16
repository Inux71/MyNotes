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
        VStack {
            List{
                NavigationLink("Test", value: "preview")
            }
        }
        .navigationTitle("Notatki")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $_search)
        .toolbar {
            NavigationLink(value: "add") {
                Image(systemName: "doc.badge.plus")
            }
        }
    }
}
