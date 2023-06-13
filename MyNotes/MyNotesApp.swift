//
//  MyNotesApp.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 04/04/2023.
//

import SwiftUI

@main
struct MyNotesApp: App {
    @StateObject var notes = NotesStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack() {
                NoteListView()
            }
            .environmentObject(notes)
        }
    }
}
