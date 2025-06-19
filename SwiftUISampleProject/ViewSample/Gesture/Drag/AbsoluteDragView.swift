//
//  AbsoluteDragView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/19.
//  
//

import SwiftUI

/// 絶対ドラッグ
struct AbsoluteDragView: View {
    /// 絶対位置
    @State private var position = CGPoint(x: 100, y: 100)

    // MARK: - body

    var body: some View {
        Color.blue
            .frame(width: 40, height: 40.0)
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.location
                    }
                    .onEnded { value in
                        position = value.location
                    }
            )
    }
}

#Preview {
    AbsoluteDragView()
}
