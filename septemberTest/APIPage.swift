//
//  APIPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct APIPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fact of the day")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            RoundedRectangle(cornerRadius: 20)
                .padding()
                .foregroundColor(.accentColor)
        }
    }
}

struct APIPage_Previews: PreviewProvider {
    static var previews: some View {
        APIPage()
    }
}
