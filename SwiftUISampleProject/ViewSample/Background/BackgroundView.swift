//
//  BackgroundView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/04/30.
//  
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) 
            + Text("Hello, World!")
        }
        .frame(width: 200, height: 100)
        .background(Background1View())
    }
}

#Preview {
    BackgroundView()
}
