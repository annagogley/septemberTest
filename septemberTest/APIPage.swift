//
//  APIPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct APIPage: View {
    var factManager = NetworkManager()
    @ObservedObject var connectionManager = ConnectionManager()
    @State var fact : String = NetworkManager().lastFact()
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fact of the day")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(connectionManager.isConnected ? fact : connectionManager.connectionDescription)
                .foregroundColor(.white)
                .padding()
                .background(connectionManager.color)
                .cornerRadius(20)
            Spacer()
        }
        .padding()
        .onReceive(factManager.factDelivered, perform: {fact = $0})
        .onAppear{
            if connectionManager.isConnected {
                factManager.fetchFact()
            }
        }
    }
}

struct APIPage_Previews: PreviewProvider {
    static var previews: some View {
        APIPage(fact: "Here will be fact")
    }
}
