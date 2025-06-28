//
//  TwirlTransitionView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/18.
//  
//

import SwiftUI

/// くるくるカスタムトランジションView
struct TwirlTransitionView: View {
    /// 表示フラグ
    @State private var isShow = true

    // MARK: - body

    var body: some View {
        ZStack {
            if isShow {
                Image(.icon)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(.rect(cornerRadius: 80))
                    .twirl()
            }

            Button("toggle") {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isShow.toggle()
                }
            }
            .offset(y: 120)
        }
    }
}

#Preview {
    TwirlTransitionView()
}
