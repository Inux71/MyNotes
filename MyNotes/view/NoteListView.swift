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
    @State private var _searchedText: String = ""
    @State private var _isAlertPresented: Bool = false
    @State private var _indexSet: IndexSet = IndexSet(integer: 0)
    
    private var _filteredNotes: [Note] {
        if self._searchedText.isEmpty {
            return self.notesStore.notes
        } else {
            return self.notesStore.notes.filter {
                $0.title.contains(self._searchedText)
            }
        }
    }
    
    var body: some View {
        VStack {
            if self.notesStore.notes.count == 0 {
                Text("Brak notatek 😭")
            }
            
            List {
                ForEach(self._filteredNotes) { note in
                    NavigationLink(destination: NotePreviewView(note: note)) {
                        HStack {
                            Text(note.title)
                        }
                    }
                    .foregroundColor(.yellow)
                }
                .onDelete { idx in
                    self._indexSet = idx
                    self._isAlertPresented = true
                }
                .alert("Czy na pewno usunąć?", isPresented: self.$_isAlertPresented) {
                    Button("TAK", action: {
                        self.notesStore.remove(offset: self._indexSet)
                        self._isAlertPresented = false
                    })
                    
                    Button("Nie", role: .cancel) {}
                }
                .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                    isPresentingConfirm = true
                }
            }
            .confirmationDialog("Usunąć wszystkie notatki?",isPresented: $isPresentingConfirm) {
                Button("Usuń wszystkie notatki", role: .destructive) {
                    self.notesStore.clear()
                }
                Button("Anuluj", role: .cancel) {}
            }
        }
        .searchable(text: self.$_searchedText)
        .navigationTitle("Notatki")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            if self.notesStore.notes.count != 0 {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.yellow)
                }
            }
            
            ToolbarItem() {
                NavigationLink(destination: AddNoteView()) {
                    Text("Dodaj")
                        .foregroundColor(.yellow)
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
