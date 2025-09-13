//
//  Lab1App.swift
//  Lab1
//
//  Created by Macbook Air on 12.09.2025.
//

import SwiftUI

@main
struct Lab1App: App {
    var body: some Scene {
        DocumentGroup(newDocument: Lab1Document()) { file in
            ContentView(document: file.$document)
        }
    }
}
