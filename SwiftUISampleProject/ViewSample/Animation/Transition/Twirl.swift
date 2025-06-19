//
//  Twirl.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/19.
//  
//

import SwiftUI

/// くるくるトランジション
struct Twirl: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .scaleEffect(phase.isIdentity ? 1 : 0.5)
            .opacity(phase.isIdentity ? 1 : 0)
            .blur(radius: phase.isIdentity ? 0 : 8)
            .rotationEffect(
                .degrees(
                    phase == .willAppear ? 360 :
                        phase == .didDisappear ? -360 :
                            .zero
                )
            )
            .brightness(phase == .willAppear ? 1 : 0)
    }
}

extension View {
    public func twirl() -> some View {
        transition(Twirl())
    }
}
