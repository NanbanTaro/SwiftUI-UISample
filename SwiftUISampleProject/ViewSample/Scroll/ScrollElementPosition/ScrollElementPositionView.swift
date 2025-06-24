//
//  ScrollElementPositionView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/24.
//
//

import SwiftUI

/// 特定のコンテンツが通過した時、バナーを表示させるスクロールView
struct ScrollElementPositionView: View {
    @State private var targetPosition: CGFloat = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // コンテンツ
                ForEach(0..<50) { i in
                    if i == 5 {
                        Color.red
                            .frame(height: 200)
                            .background(
                                GeometryReader { proxy in
                                    Color.clear
                                        .preference(
                                            key: ViewOffsetKey.self,
                                            value: proxy.frame(in: .named("scrollContent")).maxY
                                        )
                                }
                            )
                    } else {
                        Color.blue
                            .opacity(0.3)
                            .frame(height: 50)
                    }
                }
            }
        }
        .coordinateSpace(.named("scrollContent"))
        .onPreferenceChange(ViewOffsetKey.self) { newValue in
            Task { @MainActor in
                targetPosition = newValue
            }
        }
        .overlay(alignment: .topLeading) {
            Text(String(format: "Target Position: %.2f", targetPosition)).monospacedDigit()
                .padding()
                .background(Color.white)
        }
        .overlay(alignment: .bottom) {
            extraContent
                .opacity(extraContentOpacity(targetPosition))
                .offset(x: 0, y: extraContentOffset(targetPosition))
        }
    }
    
    /// 透過の線形方程式
    var extraContentOpacity = LinearEquation.segmentedLinearEquation(
        fromPoint: .init(x: -20, y: 1.0),
        toPoint: .init(x: 0, y: 0)
    )
    
    /// offsetの線型方程式
    var extraContentOffset = LinearEquation.segmentedLinearEquation(
        fromPoint: .init(x: -20, y: 0),
        toPoint: .init(x: 0, y: 100)
    )
    
    /// 表示コンテンツ
    var extraContent: some View {
        Text("Tracked content not on screen!")
            .monospacedDigit()
            .padding(24)
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .cornerRadius(8)
            .shadow(radius: 4)
            .padding()
    }
    
    /// 線形方程式
    struct LinearEquation {
        struct Point {
            var x: CGFloat
            var y: CGFloat
        }

        /// 線形補完クロージャを返す関数
        static func segmentedLinearEquation(fromPoint: Point, toPoint: Point) -> (CGFloat) -> CGFloat {
            return { inputX in
                let x1 = fromPoint.x
                let y1 = fromPoint.y
                let x2 = toPoint.x
                let y2 = toPoint.y

                // 範囲外（左側） → 開始点の値を返す
                if inputX <= x1 { return y1 }
                // 範囲外（右側） → 終点の値を返す
                if inputX >= x2 { return y2 }

                // 線形補間：y = y1 + ((y2 - y1) / (x2 - x1)) * (x - x1)
                let slope = (y2 - y1) / (x2 - x1)
                return y1 + slope * (inputX - x1)
            }
        }
    }
    
    /// カスタムPreferenceKey
    private struct ViewOffsetKey: PreferenceKey {
        static let defaultValue: CGFloat = 0

        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
}

#Preview {
    NavigationStack {
        ScrollElementPositionView()
            .navigationTitle("Scrollable Content")
    }
}
