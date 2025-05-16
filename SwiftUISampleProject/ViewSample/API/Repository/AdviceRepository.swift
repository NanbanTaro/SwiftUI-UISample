//
//  AdviceRepository.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/05/16.
//  
//

import Alamofire

final class AdviceRepository {
    /// ベースURL
    private let baseUrl = "https://api.adviceslip.com/advice"
}

// MARK: - AdviceRepositoryProtocol

extension AdviceRepository: AdviceRepositoryProtocol {
    func requestAdvice() async -> Result<String, Error> {
        let response = await AF
            .request(self.baseUrl, interceptor: .retryPolicy)
            .serializingDecodable(AdviceModel.self)
            .response
        switch response.result {
        case .success(let model):
            return .success(model.slip.advice)
        case .failure(let error):
            return .failure(error)
        }
    }
}
