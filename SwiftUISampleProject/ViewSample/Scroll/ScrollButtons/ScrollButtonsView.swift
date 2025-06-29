//
//  ScrollButtonsView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/05/21.
//  
//

import SwiftUI

/// 横スクロールボタン
struct ScrollButtonsView<Item: ScrollButtonTypes>: View {
    /// 選択されたタイプ
    @Binding var selectedType: Item
    /// アニメーション名
    @Namespace private var animation

    // MARK: - body

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(Array(Item.allCases), id: \.self) { type in
                    Button {
                        withAnimation(.smooth) {
                            selectedType = type
                        }
                    } label: {
                        Text(type.name)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                            .padding(.horizontal, 20)
                            .frame(height: 44)
                            .foregroundStyle(selectedType == type ? .white : .gray)
                            .background {
                                if selectedType == type {
                                    Capsule()
                                        .fill(.blue.gradient)
                                        .matchedGeometryEffect(id: "ButtonBackground", in: animation)
                                }
                            }
                    }
                }
            }
            .padding(.horizontal, 8)
        }
        .scrollPosition(id: .init(get: { selectedType }, set: { _ in }), anchor: .center)
    }
}

#Preview {
    ScrollButtonsSampleView()
}
