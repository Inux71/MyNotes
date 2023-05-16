//
//  MyNotesApp.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 04/04/2023.
//

import SwiftUI

@main
struct MyNotesApp: App {
    @State private var _path: [String] = []
    @StateObject var notes = NotesStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: self.$_path) {
                NoteListView()
                    .navigationDestination(for: String.self) { destination in
                        self.getView(for: destination)
                    }
            }
            .environmentObject(notes)
        }
    }
    
    private func getView(for destination: String) -> AnyView {
        switch destination {
            case "add":
                return AnyView(AddNoteView())
            case "edit":
                return AnyView(NoteEditView())
            default:
                return AnyView(EmptyView())
        }
        
    }
}
