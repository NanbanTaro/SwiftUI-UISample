//
//  ScrollAnimationView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/15.
//
//

import SwiftUI

/// スクロール表示時のアニメーションアイテム
struct ScrollAnimationView: View {
    /// パレット群
    let pallets = ColorPallet.samples

    // MARK: - body

    var body: some View {
        ScrollView {
            Color.gray
                .frame(height: 320)

            ForEach(pallets) { pallet in
                LazyVStack(spacing: 0) {
                    Color.gray
                        .frame(height: 240)

                    ScrollAnimationItem(pallet: pallet)
                        .frame(height: 80)
                }
                .clipShape(.rect(cornerRadius: 8))
                .padding(20)
            }
        }
    }
}

#Preview {
    ScrollAnimationView()
}
