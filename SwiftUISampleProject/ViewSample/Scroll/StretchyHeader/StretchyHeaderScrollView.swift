//
//  StretchyHeaderScrollView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/24.
//
//

import SwiftUI

/// ヘッダー拡大スクロールView
///
/// 下にドラッグするとヘッダーに設定したViewが拡大(+ブラー)する
struct StretchyHeaderScrollView: View {
    @State private var scrollOffset: CGFloat = 0

    private let headerHeight = UIScreen.main.bounds.height * 0.4

    var body: some View {
        ScrollView {
            // ヘッダー
            GeometryReader { proxy in
                let offset = proxy.frame(in: .named("scroll")).minY
                let height = max(headerHeight + offset, headerHeight)

                Image(.sakura)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: height)
                    .clipped()
                    .offset(y: offset < 0 ? 0 : -offset)
                    .blur(radius: offset / 50)
            }
            .frame(height: headerHeight)

            // コンテンツ
            LazyVStack(spacing: 16) {
                ForEach(0..<30) { index in
                    Text("行番号 \(index)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .coordinateSpace(name: "scroll")
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    StretchyHeaderScrollView()
}
