//
//  NoteModel.swift
//  MyNotes
//
//  Created by Łukasz Myśliwiec on 16/05/2023.
//

import Foundation

struct Note: Identifiable, Codable, Hashable {
    let id: UUID
    let content: String
    let title: String
    let isPrivate: Bool
    
    init(content: String, title: String, isPrivate: Bool) {
        self.id = UUID()
        self.content = content
        self.title = title
        self.isPrivate = isPrivate
    }
    
    init (id: UUID, content: String, title: String, isPrivate: Bool = false) {
        self.id = id
        self.content = content
        self.title = title
        self.isPrivate = isPrivate
    }
}
