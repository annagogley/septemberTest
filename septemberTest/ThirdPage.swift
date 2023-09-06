//
//  ThirdPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct ThirdPage: View {
    @State private var isPresentWebView = false
    var body: some View {
        Button {
            isPresentWebView = true
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
//                            .ignoresSafeArea()
                }
    }
}

struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPage()
    }
}
