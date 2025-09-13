//
//  ContentView.swift
//  Lab1
//
//  Created by Macbook Air on 12.09.2025.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: Lab1Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(Lab1Document()))
}
