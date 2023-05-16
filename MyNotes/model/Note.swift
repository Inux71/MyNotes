//
//  NoteModel.swift
//  MyNotes
//
//  Created by Łukasz Myśliwiec on 16/05/2023.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let content: String
    let title: String
    
    init(content: String, title: String) {
        self.id = UUID()
        self.content = content
        self.title = title
    }
}
