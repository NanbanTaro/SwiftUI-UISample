//
//  RadialLayout.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/25.
//  
//

import SwiftUI

struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        // Proposalのサイズをそのまま必要サイズとして返却する
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        // 円形に配置
        // レイアウトの半径
        let radius = min(bounds.size.width, bounds.size.height) / 2

        // サブビュー間の角度
        let angle = Angle.degrees(360 / Double(subviews.count)).radians

        for (index, subview) in subviews.enumerated() {
            // 回転のアフィン変換
            let transform = CGAffineTransform(rotationAngle: angle * Double(index))
            // 座標にアフィン変換を適用
            var point = CGPoint(x: 0, y: -radius).applying(transform)
            // 座標を領域の中心に移動
            point.x += bounds.midX
            point.y += bounds.midY

            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }

        // 縦に配置
//        var point = bounds.origin
//        for subview in subviews {
//            subview.place(at: point, anchor: .topLeading, proposal: .unspecified)
//            point.y += subview.dimensions(in: .unspecified).height
//        }
    }
}
