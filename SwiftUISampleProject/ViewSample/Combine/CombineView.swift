//
//  CombineView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/05/17.
//  
//

import SwiftUI

struct CombineView: View {
    @StateObject private var vm = CombineViewModel()

    // MARK: - body

    var body: some View {
        VStack(spacing: 4) {
            // 入力フィールド
            TextField("入力フィールド", text: $vm.text)
                .padding(.bottom, 4)

            // エラー表示
            HStack(spacing: 4) {
                Image(systemName: vm.isKinds ? "checkmark.circle.fill" : "checkmark.circle")
                Text("半角英数字のみを入力している")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .opacity(vm.isKinds ? 1 : 0.2)
            HStack(spacing: 4) {
                Image(systemName: vm.isLengths ? "checkmark.circle.fill" : "checkmark.circle")
                Text("12文字以上入力している")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .opacity(vm.isLengths ? 1 : 0.2)
            HStack(spacing: 4) {
                Image(systemName: vm.isLoop ? "checkmark.circle.fill" : "checkmark.circle")
                Text("同一の文字列が3回以上繰り返されていない")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .opacity(vm.isLoop ? 1 : 0.2)
        }
        .padding()
    }
}

#Preview {
    CombineView()
}
