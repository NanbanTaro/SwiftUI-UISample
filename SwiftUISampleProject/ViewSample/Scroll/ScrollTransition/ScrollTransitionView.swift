//
//  ScrollTransitionView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/19.
//
//

import SwiftUI

/// カルーセル + ScrollTransition
struct ScrollTransitionView: View {
    private let pictures: [Image] = Array(repeating: Image(.sakura), count: 6)

    // MARK: - body

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 28) {
                ForEach(pictures.indices, id: \.self) { index in
                    picture(at: index)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
                                .rotationEffect(.degrees(phase.value * 8))
                                .offset(y: phase.isIdentity ? 0 : 16)
                                .rotation3DEffect(
                                    .degrees(phase.isIdentity ? 0 : 12),
                                    axis: (x: 1, y: 0, z: 0)
                                )
                        }
                        .containerRelativeFrame(.horizontal)
                }

            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 60)
    }

    private func picture(at index: Int) -> some View {
        pictures[index]
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    ScrollTransitionView()
}
