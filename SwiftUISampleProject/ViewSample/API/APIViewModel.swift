//
//  APIViewModel.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import Foundation

@MainActor
@Observable
final class APIViewModel {
    /// アドバイステキスト
    var adviceText = "アドバイスはありません。"
    /// 読み込みフラグ
    var isLoading = false

    private let repository: AdviceRepositoryProtocol

    // MARK: - Initializer

    init(repository: AdviceRepositoryProtocol = AdviceRepository()) {
        self.repository = repository
    }

    // MARK: - Methods

    /// ランダムアドバイスを取得する
    func getRandomAdvice() async {
        isLoading = true
        defer { isLoading = false }

        let result =  await self.repository.requestAdvice()
        switch result {
        case .success(let success):
            self.adviceText = success
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}
