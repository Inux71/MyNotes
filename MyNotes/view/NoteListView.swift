//
//  NoteListView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var notesStore: NotesStore
    @State private var isPresentingConfirm: Bool = false

    var body: some View {
        VStack {
            List {
                ForEach(self.notesStore.notes) { note in
                    NavigationLink(destination: NotePreviewView(note: note)) {
                        HStack {
                            Text(note.title)
                        }
                    }
                }
                .onDelete { idx in
                    self.notesStore.remove(offset: idx)
                }
                .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) {
                    _ in
                    isPresentingConfirm = true
                }
            }.confirmationDialog("Delete all notes?",isPresented: $isPresentingConfirm) {
                Button("Delete all notes", role: .destructive) {
                    self.notesStore.notes.removeAll()
                }
            }
        }
        .navigationTitle("Notatki")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            NavigationLink(value: "add") {
                Image(systemName: "doc.badge.plus")
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
