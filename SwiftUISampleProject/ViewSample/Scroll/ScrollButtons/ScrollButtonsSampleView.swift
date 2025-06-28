//
//  ScrollButtonsSampleView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/05/22.
//  
//

import SwiftUI

struct ScrollButtonsSampleView: View {
    /// 選択された種別
    @State private var selectedType = Fruits.apple

    // MARK: - body

    var body: some View {
        VStack(spacing: 20) {
            ScrollButtonsView(selectedType: $selectedType)
            Text(selectedType.icon)
                .font(.system(size: 60))
        }
    }
}

#Preview {
    ScrollButtonsSampleView()
}
