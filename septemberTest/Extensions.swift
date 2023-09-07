//
//  Extensions.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
