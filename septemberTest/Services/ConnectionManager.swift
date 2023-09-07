//
//  ConnectionManager.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import Foundation
import SwiftUI
import Network

class ConnectionManager: ObservableObject {
    
    @Published var isConnected = true
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "ConnectionManager")

    var color : Color {
        return isConnected ? .blue : .red
    }
    
    var connectionDescription : String {
        return "Seems like you're not connected to the Internet. Couldn't fetch facts for you today :("
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
