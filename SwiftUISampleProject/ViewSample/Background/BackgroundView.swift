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
            Text("FirstText")
            + Text(" ")
            + Text("SecondText")
        }
        .frame(width: 200, height: 100)
        .background(LinearGradientBackgroundView())
    }
}

#Preview {
    BackgroundView()
}
