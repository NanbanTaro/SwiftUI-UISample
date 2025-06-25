//
//  RelativeDragView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/18.
//  
//

import SwiftUI

/// 相対ドラッグ
struct RelativeDragView: View {
    /// 相対位置
    @State private var position = CGSize.zero
    /// ドラッグのoffset
    @GestureState private var dragOffset = CGSize.zero

    // MARK: - body

    var body: some View {
        Color.blue
            .frame(width: 40, height: 40.0)
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        position.width += value.translation.width
                        position.height += value.translation.height
                    }
            )
    }
}

#Preview {
    RelativeDragView()
}
