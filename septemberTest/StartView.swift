//
//  StartView.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct StartView: View {
    @State var tappedButton : Bool = false
    var body: some View {
        isButtonTapped() ? AnyView(WebView(url: URL(string: "https://google.com")!).ignoresSafeArea()) : AnyView(MenuView())
    }
    
    func isButtonTapped() -> Bool {
        if UserDefaults.standard.bool(forKey: "tappedButton") == true {
            return true
        } else {
            return false
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
