//
//  MenuView.swift
//  septemberTest
//
//  Created by Аня Воронцова on 07.09.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            NotesPage(vm: NotesPage.ViewModel())
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
            APIPage(vm: APIPage.ViewModel())
                .tabItem {
                    Label("Facts", systemImage: "lightbulb")
                }
            ThirdPage()
                .tabItem {
                    Label("WebView", systemImage: "network")
                }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
