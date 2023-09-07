//
//  ThirdPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct ThirdPage: View {
    
    var body: some View {
        ButtonView()
    }
}

struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPage()
    }
}

struct ButtonView: View {
    @State private var isPresentWebView = false
    @State private var showAlert = false
    @ObservedObject var connectionManager = ConnectionManager()
    let defaults = UserDefaults.standard
    var body: some View {
        Button {
            if connectionManager.isConnected {
                isPresentWebView = true
                defaults.set(true, forKey: "tappedButton")
            } else {
                showAlert.toggle()
            }
        } label: {
            ZStack {
                Capsule(style: .circular)
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 50)
                Text("Welcome to the Internet!")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .fullScreenCover(isPresented: $isPresentWebView) {
            WebView(url: URL(string: "https://google.com")!)
                .ignoresSafeArea()
        }
        .alert("Сonnection problem. Please check network connection.", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
