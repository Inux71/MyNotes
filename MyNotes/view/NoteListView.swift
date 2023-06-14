//
//  NoteListView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NoteListView: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var notesStore: NotesStore
    @State private var isPresentingConfirm: Bool = false
    
    var body: some View {
        VStack {
            if self.notesStore.notes.count == 0 {
                Text("Brak notatek 😭")
            }
            
            List {
                ForEach(self.notesStore.notes) { note in
                    NavigationLink(destination: NotePreviewView(note: note)) {
                        HStack(spacing: 8.0) {
                            if note.isPrivate {
                                Image(systemName: "lock")
                            }
                            Text(note.title)
                        }
                    }
                }
                .onDelete { idx in
                    self.notesStore.remove(offset: idx)
                }
                .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                    isPresentingConfirm = true
                }
                .environment(\.editMode, editMode)
            }
            .confirmationDialog("Usunąć wszystkie notatki?",isPresented: $isPresentingConfirm) {
                Button("Usuń wszystkie notatki", role: .destructive) {
                    self.notesStore.clear()
                }
                Button("Anuluj", role: .cancel) {}
            }
        }
        .navigationTitle("Notatki")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            if self.notesStore.notes.count != 0 {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            guard let editMode = editMode else { return }
                            
                            switch editMode.wrappedValue {
                            case .inactive:
                                editMode.wrappedValue = .active
                            case .active:
                                editMode.wrappedValue = .inactive
                            default:
                                break
                            }
                        }
                    }) {
                        let isEditing = editMode?.wrappedValue.isEditing
                        
                        if let isEditing {
                            Text(isEditing ? "Gotowe" : "Edytuj")
                        } else {
                            Text("")
                        }
                    }
//                    EditButton()
                }
            }
            
            ToolbarItem() {
                NavigationLink(destination: AddNoteView()) {
                    Text("Dodaj")
                }
            }
        }
    }
}


extension NSNotification.Name {
    public static let deviceDidShakeNotification = NSNotification.Name("MyDeviceDidShakeNotification")
}


extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}
