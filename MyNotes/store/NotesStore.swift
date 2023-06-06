//
//  NotesStore.swift
//  MyNotes
//
//  Created by Łukasz Myśliwiec on 16/05/2023.
//

import Foundation

class NotesStore: ObservableObject {
    @Published var notes: [Note]
    
    init() {
        self.notes = Storage.getData(forKey: "NOTES")
    }
    
    func insert(note: Note) {
        notes.append(note)
        Storage.saveData(data: self.notes, forKey: "NOTES")
    }
    
    func remove(offset: IndexSet) {
        notes.remove(atOffsets: offset)
        Storage.saveData(data: self.notes, forKey: "NOTES")
    }
    
    func update(note: Note) {
        if let index = self.notes.firstIndex(where: { $0.id == note.id }) {
            self.notes[index] = note
        }
        
        Storage.saveData(data: self.notes, forKey: "NOTES")
    }
}
