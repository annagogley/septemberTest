//
//  NotesPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct NotesPage: View {
    
    @StateObject var vm = ViewModel()
    
    @FetchRequest(
        entity: Notes.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Notes.id, ascending: false)]
    ) var notesData: FetchedResults<Notes>
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                        .frame(height: 50)
                        .foregroundColor(.white)
                    TextField("Enter your thaughts", text: $vm.note)
                        .frame(height: 50)
                        .textFieldStyle(.plain)
//                        .foregroundColor(.gray)
                        .padding()
                }
                Button {
                    vm.saveNote(notesData: notesData)
                    hideKeyboard()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 50)
                        Text("Save")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .disabled(vm.isNoteEmpty)
            }
            .padding()
            ScrollView() {
                if vm.thereIsNoData{
                    Text("No notes yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    ForEach(notesData, id: \.self) {
                        element in
                        if let noteData = element.note {
                            Text(noteData)
                                .padding(.bottom)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

extension NotesPage {
    class ViewModel : ObservableObject {
        
        @Published var note = ""
        
        init(note: String = "") {
            self.note = note
        }
        
        var isNoteEmpty : Bool {
            return note.isEmpty
        }
        
        var thereIsNoData : Bool {
            return CoreDataStack.shared.isEmpty
        }
        
        func saveNote(notesData : FetchedResults<Notes>) {
            let newNote = Notes(context: CoreDataStack.shared.managedContext)
            newNote.note = note
            if let lastData = notesData.first?.id {
                newNote.id = lastData + 1
            } else {
                newNote.id = 0
            }
            CoreDataStack.shared.saveContext()
            note = ""
        }
    }
}

struct NotesPage_Previews: PreviewProvider {
    static var previews: some View {
        NotesPage(vm: NotesPage.ViewModel())
    }
}


