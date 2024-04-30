//
//  Background1View.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/04/30.
//
//

import SwiftUI

struct Background1View: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(
                LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                               startPoint: .top,
                               endPoint: .bottom)
//                .shadow(.inner(radius: 8))
                .shadow(.drop(radius: 8))
            )
    }
}

#Preview {
    Background1View()
}
