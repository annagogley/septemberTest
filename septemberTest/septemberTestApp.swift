//
//  septemberTestApp.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import SwiftUI

@main
struct septemberTestApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, CoreDataStack.shared.managedContext)
        }
    }
}
