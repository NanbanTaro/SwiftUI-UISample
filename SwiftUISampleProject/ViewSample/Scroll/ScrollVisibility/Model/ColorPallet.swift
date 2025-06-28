//
//  ColorPallet.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/15.
//  
//

import SwiftUI

struct ColorPallet: Identifiable {
    static let samples = [Self(), Self(), Self(), Self()]

    /// ID
    let id: UUID
    /// 色
    let colors: [Color]

    // MARK: - Initializer

    init() {
        self.id = UUID()
        self.colors = [.red, .blue, .green, .yellow, .pink, .brown]
    }
}
