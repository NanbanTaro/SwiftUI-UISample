//
//  NumericTextAnimationView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/16.
//  
//

import SwiftUI

struct NumericTextAnimationView: View {
    @State private var count = 50

    var body: some View {
        HStack {
            Button("", systemImage: "minus.circle") {
                withAnimation {
                    count -= 1
                }
            }
            .disabled(count == 0)

            Text("\(count)")
                .frame(width: 80)
                .font(.largeTitle)
                .monospacedDigit()
                .contentTransition(.numericText(value: Double(count)))

            Button("", systemImage: "plus.circle") {
                withAnimation {
                    count += 1
                }
            }
            .disabled(count == 100)
        }
    }
}

#Preview {
    NumericTextAnimationView()
}
