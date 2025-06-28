//
//  LinearGradientView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/04/30.
//
//

import SwiftUI

/// グラデーション
struct LinearGradientView: View {
    var body: some View {
        VStack {
            Text("FirstText")
            + Text(" ")
            + Text("SecondText")
        }
        .frame(width: 200, height: 100)
        .background(linearGradient)
    }

    var linearGradient: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(
                LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                               startPoint: .top,
                               endPoint: .bottom)
                .shadow(.drop(radius: 8))
            )
    }
}

#Preview {
    LinearGradientView()
}
