//
//  NoteModel.swift
//  MyNotes
//
//  Created by Łukasz Myśliwiec on 16/05/2023.
//

import Foundation

struct Note: Identifiable, Hashable {
    let id = UUID()
    let content: String
    let title: String
}
