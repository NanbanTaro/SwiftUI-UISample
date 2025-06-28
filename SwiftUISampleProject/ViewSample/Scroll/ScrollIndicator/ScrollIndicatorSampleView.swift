//
//  ScrollIndicatorSampleView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/28.
//
//

import SwiftUI

struct ScrollIndicatorSampleView: View {
    /// 進捗
    @State private var progress: CGFloat = 0
    /// テストデータ
    private let tests = Array(repeating: "テスト", count: 20)

    // MARK: - body

    var body: some View {
        VStack {
            ScrollIndicatorView(progress: $progress) {
                // ヘッダー画像
                Image(.sakura)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 12))
                    .padding()

                // テストリスト
                ForEach(tests.indices, id: \.self) { index in
                    Text("\(tests[index]): \(index)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.gray)
                        }

                }
            }

            ProgressView(value: progress)
                .padding()
        }
    }
}

#Preview {
    ScrollIndicatorSampleView()
}
