//
//  RadialLayoutView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/06/02.
//
//

import SwiftUI

struct RadialLayoutView: View {
    var body: some View {
        HStack(spacing: 0) {
            RadialLayout {
                Text("A")
                    .frame(width: 40, height: 40)
                    .background(.red)
                    .clipShape(Capsule())
                Text("B")
                    .frame(width: 40, height: 40)
                    .background(.orange)
                    .clipShape(Capsule())
                Text("C")
                    .frame(width: 40, height: 40)
                    .background(.yellow)
                    .clipShape(Capsule())
                Text("D")
                    .frame(width: 40, height: 40)
                    .background(.green)
                    .clipShape(Capsule())
                Text("E")
                    .frame(width: 40, height: 40)
                    .background(.blue)
                    .clipShape(Capsule())
                Text("F")
                    .frame(width: 40, height: 40)
                    .background(.purple)
                    .clipShape(Capsule())
            }
            .background(.green)
        }
    }
}

#Preview {
    RadialLayoutView()
}
