//
//  StartView.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        TabView {
            NotesPage()
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
            APIPage()
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

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
