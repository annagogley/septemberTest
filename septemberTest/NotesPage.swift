//
//  NotesPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct NotesPage: View {
    
    @State var note = ""
    var notesData = CoreDataStack.shared.getAllMoods()

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                        .frame(height: 50)
                        .foregroundColor(.white)
                    TextField("Enter your thaughts", text: $note)
                        .frame(height: 50)
                        .textFieldStyle(.plain)
                        .foregroundColor(.gray)
                        .padding()
                }
                Button {
                    let newNote = Notes(context: CoreDataStack.shared.managedContext)
                    newNote.note = note
                    CoreDataStack.shared.saveContext()
                    note = ""
                    hideKeyboard()
//                   CoreDataStack.shared.deleteAllData()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 50)
                        Text("Save")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .disabled(note.isEmpty)
            }
            .padding()
            ScrollView {
                if CoreDataStack.shared.isEmpty{
                    Text("No notes yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ForEach(notesData, id: \.self) {
                        element in
                        if let noteData = element.note {
                            Text(noteData)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct NotesPage_Previews: PreviewProvider {
    static var previews: some View {
        NotesPage()
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
