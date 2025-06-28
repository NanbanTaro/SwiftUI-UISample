//
//  ScrollIndicatorView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/26.
//
//

import SwiftUI

/// スクロールインジケータView
///
/// コンテンツのスクロール進捗をprogressで受け取れる
struct ScrollIndicatorView<Content: View>: View {
    // MARK: - Properties

    /// 進捗率
    @Binding var progress: CGFloat
    /// スクロールに表示するView
    let content: Content

    /// スクロール可能な高さ
    @State private var scrollableHeight: CGFloat = 0

    // MARK: - Initializer

    init(
        progress: Binding<CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self._progress = progress
        self.content = content()
    }

    // MARK: - body

    var body: some View {
        GeometryReader { mainProxy in
            // スクロール全体の高さ
            let containerHeight = mainProxy.size.height

            ScrollView {
                VStack {
                    content
                        .padding(.horizontal, 12)
                        .background {
                            GeometryReader { proxy in
                                Color.clear
                                    .preference(
                                        key: ScrollIndicatorPreferenceKey.self,
                                        value: proxy.frame(in: .named("scrollContent")).maxY
                                    )
                            }
                        }
                }
            }
            .coordinateSpace(.named("scrollContent"))
            .onPreferenceChange(ScrollIndicatorPreferenceKey.self) { offset in
                Task { @MainActor in
                    // スクロール下部の位置Y座標
                    let contentBottom = offset
                    // 残りのスクロール可能な高さ
                    let newScrollableHeight = max(0, contentBottom - containerHeight)

                    if scrollableHeight <= 0 {
                        scrollableHeight = newScrollableHeight
                    }
                    progress = max(0, 1 - (newScrollableHeight / scrollableHeight))
                }
            }
        }
    }
}

private struct ScrollIndicatorPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    @Previewable @State var progress: CGFloat = 0
    let tests = Array(repeating: "テスト", count: 20)

    VStack {
        ScrollIndicatorView(progress: $progress) {
            // ヘッダー画像
            Image(.sakura)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(cornerRadius: 12))
                .padding()

            // テストリスト
            ForEach(tests.indices, id: \.self) { index in
                Text("\(tests[index]): \(index)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.gray)
                    }

            }
        }

        ProgressView(value: progress)
            .padding()
    }
}
