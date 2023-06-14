//
//  NoteEditView.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 18/04/2023.
//

import SwiftUI
import LocalAuthentication

struct NotePreviewView: View {
    @Environment(\.dismiss) var dismiss
    @State var isAuthenticated = false
    @State var noteEditVisible: Bool = false
    
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            if isAuthenticated {
                Text(self.note.content)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            } else {
                HStack(spacing: 8.0) {
                    Image(systemName: "lock")
                    Text("Ta notatka jest zablokowana!")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Podgląd - \(self.note.title)")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    noteEditVisible.toggle()
                }) {
                    Text("Edytuj")
                }
            }
        }
        .sheet(isPresented: $noteEditVisible) {
            NavigationStack() {
                NoteEditView(note: note)
            }
        }
        .onAppear(perform: {
            if note.isPrivate {
                authenticate()
            } else {
                isAuthenticated = true
            }
        })
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    withAnimation {
                        isAuthenticated = true
                    }
                } else {
                }
            }
        } else {
            // no biometrics
        }
    }
}
