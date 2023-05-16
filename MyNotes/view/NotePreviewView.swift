//
//  NoteEditView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NotePreviewView: View {
    var onNavigateToEditView: () -> Void
    
    var body: some View {
        ScrollView {
            
        }
        .navigationTitle("Notatka 1")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: self.onNavigateToEditView) {
                    Text("Edytuj")
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button(action: {}) {
                    Label("Pobierz", systemImage: "square.and.arrow.up")
                }
            }
        }
    }
}
