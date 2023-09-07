//
//  APIPage.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

struct APIPage: View {
    
    @ObservedObject var vm : ViewModel
    @ObservedObject var connectionManager = ConnectionManager()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fact of the day")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(vm.factText)
                .foregroundColor(.white)
                .padding()
                .background(vm.backgroundColor)
                .cornerRadius(20)
            Spacer()
        }
        .padding()
        .onAppear{
            vm.getFact()
        }
    }
}

extension APIPage {
    class ViewModel: ObservableObject {
       
        @Published var fact : String = "Loading..."
        @ObservedObject var connectionManager = ConnectionManager()
        let networkManager : NetworkServiceProtocol

        init(networkManager: NetworkServiceProtocol = NetworkService()) {
            self.networkManager = networkManager
        }

        var factText : String {
            return connectionManager.isConnected ? fact : connectionManager.connectionDescription
        }
        
        var backgroundColor : Color {
            return connectionManager.color
        }
        
        func getFact() {
            if connectionManager.isConnected {
                networkManager.fetchFact { [weak self] fact in
                    self?.fact = fact
                }
            }
        }
    }
}

struct APIPage_Previews: PreviewProvider {
    static var previews: some View {
        APIPage(vm: APIPage.ViewModel())
    }
}
