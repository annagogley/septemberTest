//
//  ThirdPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct ThirdPage: View {
    
    @ObservedObject var vm = ViewModel()
    
    let defaults = UserDefaults.standard
    var body: some View {
        Button {
            vm.buttonClicked()
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
        .fullScreenCover(isPresented: $vm.isPresentWebView) {
            WebView(url: URL(string: "https://google.com")!)
                .ignoresSafeArea()
        }
        .alert("Сonnection problem. Please check network connection.", isPresented: $vm.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPage()
    }
}

extension ThirdPage {
    class ViewModel: ObservableObject {
        @Published var isPresentWebView = false
        @Published var showAlert = false
        @ObservedObject var connectionManager = ConnectionManager()
        let defaults = UserDefaults.standard
        
        func buttonClicked() {
            if connectionManager.isConnected {
                isPresentWebView = true
                defaults.set(true, forKey: "tappedButton")
            } else {
                showAlert.toggle()
            }
        }
    }
}
