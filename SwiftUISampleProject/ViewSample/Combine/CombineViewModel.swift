//
//  CombineViewModel.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/05/17.
//  
//

import Combine
import Foundation

@MainActor
final class CombineViewModel: ObservableObject {
    // 入力テキスト
    @Published var text = ""
    /// 入力種類条件を満たすか
    @Published var isKinds = false
    /// 長さを満たすか
    @Published var isLengths = false
    /// 3回以上ループしていないか
    @Published var isLoop = false
    /// キャンセラブル
    private var cancellable = Set<AnyCancellable>()

    // MARK: - Initializer

    init() {
        // テキストを監視して、バリデーションをチェック
        $text
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] newText in
                self?.validate(text: newText)
            }
            .store(in: &cancellable)
    }

    // MARK: - Methods

    /// バリデーション処理
    /// - Parameter text: 入力テキスト
    private func validate(text: String) {
        // 半角英数字のみか
        let regex = "^[a-zA-Z0-9]*$"
        isKinds = !text.isEmpty && text.range(of: regex, options: .regularExpression) != nil

        // 長さは12文字以上か
        isLengths = text.count >= 12

        // 同じ文字列が3回以上繰り返されていないか
        let pattern = #"(.+?)\1{2,}"#
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(text.startIndex..., in: text)
            isLoop = regex.firstMatch(in: text, options: [], range: range) == nil
        } catch {
            print(error.localizedDescription)
        }
    }
}
