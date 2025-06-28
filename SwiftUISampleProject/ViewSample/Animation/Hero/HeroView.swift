//
//  HeroView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/26.
//
//

import SwiftUI

struct HeroView: View {
    @Namespace private var heroAnimation
    /// Heroアニメーションフラグ
    @State private var isBool = false

    var body: some View {
        Group {
            if isBool {
                VStack {
                    Spacer()

                    Image(systemName: "xmark")
                        .matchedGeometryEffect(
                            id: "button",
                            in: heroAnimation,
                            anchor: .center
                        )
                        .frame(width: 40, height: 40)
                        .background {
                            background
                        }
                }
            } else {
                Image(systemName: "plus")
                    .matchedGeometryEffect(
                        id: "button",
                        in: heroAnimation,
                        anchor: .center
                    )
                    .frame(width: 200, height: 200)
                    .background {
                        background
                    }
            }
        }
        .onTapGesture {
            withAnimation {
                isBool.toggle()
            }
        }
    }

    /// 背景
    var background: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.white)
            .shadow(radius: 4)
            .matchedGeometryEffect(id: "background", in: heroAnimation, anchor: .center)
    }
}

#Preview {
    HeroView()
}
