//
//  AdviceRepositoryProtocol.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/05/16.
//  
//

protocol AdviceRepositoryProtocol: Sendable {
    /// アドバイスをリクエストする
    /// - Returns: ランダムアドバイス
    func requestAdvice() async -> Result<String, Error>
}
