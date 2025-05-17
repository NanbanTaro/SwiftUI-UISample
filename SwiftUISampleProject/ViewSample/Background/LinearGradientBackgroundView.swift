//
//  LinearGradientBackgroundView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/04/30.
//
//

import SwiftUI

/// グラデーション
struct LinearGradientBackgroundView: View {
    var body: some View {
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
    LinearGradientBackgroundView()
}
