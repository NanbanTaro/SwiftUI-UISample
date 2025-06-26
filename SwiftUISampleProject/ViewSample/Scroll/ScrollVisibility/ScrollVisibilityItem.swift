//
//  ScrollVisibilityItem.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/15.
//  
//

import SwiftUI

/// スクロール表示時のアニメーションアイテム
struct ScrollVisibilityItem: View {
    /// パレット
    let pallet: ColorPallet

    /// 表示フラグ
    @State private var isShowing = false

    // MARK: - body

    var body: some View {
        GeometryReader { geometry in
            if #available(iOS 18.0, *) {
                HStack(spacing: 0) {
                    ForEach(pallet.colors, id: \.self) {color in
                        color
                            .offset(
                                x: 0,
                                y: isShowing ? 0 : geometry.size.height
                            )
                    }
                }
                .onScrollVisibilityChange(threshold: 0.9) {_ in
                    guard !isShowing else { return }

                    withAnimation(.easeOut(duration: 1)) {
                        isShowing = true
                    }
                }
            } else {
                HStack(spacing: 0) {
                    ForEach(pallet.colors, id: \.self) { color in
                        color
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollVisibilityItem(pallet: ColorPallet())
}
