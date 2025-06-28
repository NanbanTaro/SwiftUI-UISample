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
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(pictures.indices, id: \.self) { index in
                    // pictureはFrameを指定せず
                    // containerRelativeFrameとsafeAreaPaddingで大きさを調整
                    picture(at: index)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
                                .rotation3DEffect(
                                    .degrees(phase.value * -12),
                                    axis: (x: 0, y: 1, z: 0)
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

    /// 写真
    /// - Parameter index: index
    /// - Returns: 写真群からindexで指定された写真
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
