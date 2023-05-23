//
//  NotesStore.swift
//  MyNotes
//
//  Created by Łukasz Myśliwiec on 16/05/2023.
//

import Foundation

class NotesStore: ObservableObject {
    @Published var notes = [Note]()
    
    func insert(note: Note) {
        notes.append(note)
    }
    
    func remove(offset: IndexSet) {
        notes.remove(atOffsets: offset)
    }
}
